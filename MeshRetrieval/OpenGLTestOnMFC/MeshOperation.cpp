#include "stdafx.h"
#include "MeshOperation.h"

#include <math.h>
#include <cmath>
#include <stdio.h>
#include <random>

#include <gsl/gsl_sf_legendre.h>
#include <gsl/gsl_blas.h>
#include <gsl/gsl_linalg.h>

double candidate_index_array[DATASIZE] = {}; 
using namespace std; // make std:: accessible

/*Add random Gaussian Noise to verteices*/
void AddNoise(double noise_standard_deviation,MyMesh &mesh)
{
	std::default_random_engine generator;
	std::normal_distribution<double> distribution(0.0,noise_standard_deviation); //Gaussian distribution: mean value = 0.0

	for (auto it = mesh.vertices_begin(); it != mesh.vertices_end(); ++it)
	{
		double Pt[3] = {};
		for (int d=0;d<3;d++)
		{
			Pt[d]=*(mesh.point(it).data()+d);
			double randn = distribution(generator);
			if ((randn>=-1.0)&&(randn<=1.0))//Gaussian distribution range [-1.0,1.0]							        
			{
				Pt[d]= Pt[d]*(1.0+randn);
				*(mesh.point(it).data()+d)=float(Pt[d]);
			}
		}
	}
	//TEST	SH
	double SH;
	SH = gsl_sf_legendre_sphPlm(1, 1, cos(M_PI/4));
	//TEST END
	NOISE_CONTROL = false;
}

/*normalize the model and rasterize to 2R*2R*2R voxel grid*/
void NormalizeMesh(MyMesh &mesh,
				   vector<double> &grid_id_x,vector<double> &grid_id_y,vector<double> &grid_id_z)
{
	double x_max,y_max,z_max,x_min,y_min,z_min;
	FindMaxMin(mesh,x_max,y_max,z_max,x_min,y_min,z_min);

	double distance_x = x_max - x_min;
	double distance_y = y_max - y_min;
	double distance_z = z_max - z_min;
	double max_distance = distance_x;

	if (distance_y > max_distance) max_distance = distance_y;
	if (distance_z > max_distance) max_distance = distance_z;

	/*normalize and rasterize*/
	int x_grid [2*RADIUS] = {};
	int y_grid [2*RADIUS] = {};
	int z_grid [2*RADIUS] = {};
	for (MyMesh::VertexIter v_it = mesh.vertices_begin();v_it!=mesh.vertices_end(); ++v_it)
	{
		//move to positive, normalize to 1 
		double x_normalize = (mesh.point(v_it).data()[0] - x_min)/max_distance;
		double y_normalize = (mesh.point(v_it).data()[1] - y_min)/max_distance;
		double z_normalize = (mesh.point(v_it).data()[2] - z_min)/max_distance;

		*(mesh.point(v_it).data()+0) = x_normalize;
		*(mesh.point(v_it).data()+1) = y_normalize;
		*(mesh.point(v_it).data()+2) = z_normalize;

		//rasterize to 2Rx2Rx2R voxel grid
		int x_rasterize = static_cast<int>(round(x_normalize*(2*RADIUS-1)));
		int y_rasterize = static_cast<int>(round(y_normalize*(2*RADIUS-1)));
		int z_rasterize = static_cast<int>(round(z_normalize*(2*RADIUS-1)));
		
		//If this vertex hasn't been registered
		if(x_grid[x_rasterize]*y_grid[y_rasterize]*z_grid[z_rasterize]!=1)
		{
			//register
			x_grid[x_rasterize] = 1;
			y_grid[y_rasterize] = 1;
			z_grid[z_rasterize] = 1;

			//push back
			grid_id_x.push_back(double(x_rasterize));
			grid_id_y.push_back(double(y_rasterize));
			grid_id_z.push_back(double(z_rasterize));
		}
	}

	////get coordinate of grid when the value equals to 1 and calculate mean of grid_x, grid_y and grid_z
	////vector<double> grid_id_x,grid_id_y,grid_z;	
	//double centroid_x = 0.0,centroid_y = 0.0,centroid_z = 0.0;
	//for(int x_iter=0;x_iter<2*RADIUS;x_iter++)//x
	//{
	//	for(int y_iter=0;y_iter<2*RADIUS;y_iter++)//y
	//	{
	//		for(int z_iter=0;z_iter<2*RADIUS;z_iter++)//z
	//		{
	//			if(grid[x_iter*2*RADIUS*2*RADIUS+y_iter*2*RADIUS+z_iter]==1)
	//			{
	//				grid_id_x.push_back(double(x_iter));
	//				centroid_x += double(x_iter);
	//				grid_id_y.push_back(double(y_iter));
	//				centroid_y += double(y_iter);
	//				grid_id_z.push_back(double(z_iter));
	//				centroid_z += double(z_iter);
	//			}
	//		}
	//	}
	//}
	//centroid_x/=grid_id_x.size();
	//centroid_y/=grid_id_y.size();
	//centroid_z/=grid_id_z.size();

	NORMALIZE_CONTROL = FALSE;
}

void ChooseCandidate(double candidate_index_array[],int candidateIndx)
{
	int index = candidateIndx;

	if(index>=10) index = index-10;

	int CandidateIdx = int(candidate_index_array[DATASIZE-index-1]);
	//number to string
	string CandidateIdx_S = static_cast<ostringstream*>( &(ostringstream() << CandidateIdx) )->str();
	string back_filname = "./MeshData/back/back"+CandidateIdx_S+".obj";
	string seat_filname = "./MeshData/seat/seat"+CandidateIdx_S+".obj";
	string leg_filname = "./MeshData/leg/leg"+CandidateIdx_S+".obj";

	//load candidate mesh 
	MyMesh back_mesh,seat_mesh,leg_mesh;
	OpenMesh::IO::read_mesh(back_mesh, back_filname);
	OpenMesh::IO::read_mesh(seat_mesh, seat_filname);
	OpenMesh::IO::read_mesh(leg_mesh,  leg_filname);
	meshQueue.clear();
	if(candidateIndx<10)
	{
		meshQueue.push_back(seat_mesh);
		meshQueue.push_back(back_mesh);	
		meshQueue.push_back(leg_mesh);
	}
	if(candidateIndx>=10)
	{
		meshQueue.push_back(back_mesh);	
		meshQueue.push_back(seat_mesh);
		meshQueue.push_back(leg_mesh);
	}
}