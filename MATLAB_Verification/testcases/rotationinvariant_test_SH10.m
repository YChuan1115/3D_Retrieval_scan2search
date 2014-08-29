clc
clear
close all

input = [0.56419 0.750403 0.660522 0.911273 1.34284 1.50121 1.34837 1.305 1.65285 1.95048 1.8992 1.70324 1.84558 2.21515 2.33643 2.14315 2.0558 2.35662 2.63985 2.5734 2.35395 2.45887 2.81079 2.93 2.72624 2.61385 2.88901 3.17099 3.10471 2.87211 2.95047 0.0621628 
2.25676 2.44332 1.42213 1.76903 1.95221 1.78768 2.18511 3.1298 3.22037 3.22354 3.52132 3.54031 4.41476 4.63621 4.677 5.68094 5.03376 3.09151 3.65267 4.86399 4.61605 4.36635 6.02914 6.32874 5.15124 5.98927 6.68356 6.17421 5.6615 5.44711 6.29439 0.58132 
4.23142 3.94456 3.4733 4.12155 2.3928 3.55288 3.73559 3.38994 4.2894 4.46669 4.38115 5.8908 6.43707 6.06561 5.73139 7.16062 8.34532 7.0581 7.71016 7.28282 7.52989 10.1024 9.13888 7.78747 8.42773 8.5418 8.21797 9.38484 9.48922 8.68203 9.59718 1.00255 
12.1301 11.3906 4.38321 5.95409 5.66948 5.934 4.4239 7.94437 6.94301 4.47371 4.38464 5.56272 7.82891 6.10774 8.14562 9.06205 6.32662 10.5496 10.4044 14.5675 19.2359 16.5443 13.5351 10.0534 12.8025 14.1586 12.18 15.7171 16.5669 15.4267 14.6434 3.15166 
16.6436 14.827 2.39728 8.70413 5.45704 5.55617 6.94175 8.20591 7.55852 9.31936 8.58058 6.93269 9.11779 8.56121 7.7632 10.2983 11.0582 10.1053 10.4061 10.4188 14.2218 13.7182 10.3337 16.4303 16.6698 18.0921 21.2474 18.4116 17.8063 15.6946 14.3639 3.06792 
19.7466 14.9117 8.60657 14.3124 7.28036 7.578 5.81251 7.1823 8.30536 10.065 9.50471 13.349 11.552 8.70406 11.8343 10.2614 9.21384 11.1927 10.3937 12.0246 11.0339 12.7843 12.9788 9.5173 12.4312 13.6695 15.5631 18.974 13.7465 19.6121 22.3798 3.3702 
28.2095 22.8572 19.9214 22.0993 7.71517 15.5638 13.1066 10.913 11.2476 9.18182 13.0494 12.9474 12.7867 16.9377 11.3796 15.4616 14.6363 13.3177 12.989 16.2006 14.4635 13.1735 12.7353 14.0412 15.0713 14.5534 15.3934 15.9649 16.0502 16.4949 16.7629 2.93363 
51.0592 46.3167 41.0614 43.5024 21.1156 36.9497 27.5259 25.7032 26.9192 15.5808 14.876 15.2229 12.7405 13.8816 15.5851 18.4932 16.1136 21.7614 20.957 19.0624 22.5763 15.6725 22.4276 20.5124 18.0191 20.9186 15.6472 17.0764 19.0989 17.6488 18.3546 1.88541 
14.3868 17.0769 15.6524 12.8825 9.96753 12.7228 11.6848 12.1272 11.5386 11.129 10.5531 11.8841 11.8757 12.1254 14.2101 13.0911 13.9406 13.2883 10.5865 11.2834 11.1311 11.128 12.6271 12.6161 11.4516 12.0026 11.2907 10.6077 13.7815 14.5932 13.8152 1.33262 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
17.2078 20.836 18.0636 16.683 12.4326 11.9507 8.91597 8.44977 10.9292 10.6137 11.615 11.5686 12.0778 12.079 11.7517 11.8875 10.2898 10.4468 11.1811 9.20151 10.7776 12.3525 11.2903 13.6184 14.1972 13.4675 15.4109 15.8321 15.9627 15.6167 14.4279 2.20272 
501.282 506.952 441.939 396.491 247.298 246.766 105.19 116.603 47.7381 90.4856 42.5067 70.3063 56.1384 69.1823 49.5531 74.5357 40.9878 67.7776 39.5241 57.0972 45.8197 55.7474 50.4413 52.3307 47.2642 52.0781 47.6307 57.7018 50.8908 59.8002 57.1682 6.16326 
768.99 700.15 527.013 502.169 134.087 225.375 128.487 273.385 203.497 211.356 197.736 145.24 74.1067 136.574 92.8296 115.861 90.9214 111.891 74.3042 104.473 77.3714 107.396 91.2262 98.1377 87.5572 88.9032 77.8033 79.9678 91.125 100.179 78.0266 2.28709 
229.907 209.421 113.154 120.864 120.899 123.659 130.519 134.253 86.1158 101.878 103.3 106.429 91.6187 95.6852 73.5396 65.4596 88.7148 111.13 73.5912 83.1147 77.3912 55.0758 60.1783 76.1722 63.1261 41.1067 51.8949 54.8781 51.7965 43.6159 47.9786 7.46126 
146.125 132.469 33.441 77.3199 111.843 74.4482 36.0352 66.7797 72.2955 51.4982 60.2356 76.428 41.5841 36.7739 43.8502 65.8459 37.8352 30.4852 52.5433 56.6709 29.8348 44.3079 39.9418 39.511 36.3984 46.2689 46.4211 36.4256 36.0122 46.5143 39.2444 7.78442 
231.6 243.116 119.23 137.208 223.009 183.93 91.9638 90.1432 188.716 195.758 101.474 141.707 199.499 191.252 116.502 156.025 194.244 170.245 104.751 180.457 201.243 150.68 103.607 149.233 180.693 134.81 77.7672 131.356 180.342 131.951 77.2225 13.6984 
214.11 230.609 119.911 89.4466 173.125 169.194 122.919 67.6264 153.627 207.422 138.681 88.8275 114.066 184.431 159.497 95.6072 115.494 199.089 179.193 133.403 132.395 159.792 187.606 150.969 86.532 126.55 179.755 136.642 90.2675 107.853 164.888 15.4009 
107.196 147.673 116.06 58.8754 38.2807 56.18 67.8395 77.5036 83.2247 76.0177 57.1292 42.3656 43.8255 55.5802 66.2012 60.4839 35.3925 20.6344 39.9454 49.958 46.4901 35.7741 39.2735 56.2226 59.4695 45.333 37.2233 46.3947 49.9274 46.058 48.4431 1.3494 
269.401 384.67 322.409 159.094 34.1263 193.168 295.951 319.106 248.038 103.537 122.394 262.565 315.094 263.121 141.365 68.6763 179.371 266.977 281.986 209.627 81.8156 134.478 255.08 296.126 245.735 130.722 67.2056 192.889 291.203 308.425 229.666 11.3762 
86.8852 127.033 113.416 69.0758 23.4341 34.5272 52.8984 56.7421 55.7471 57.6701 60.9568 59.5872 50.5719 43.1631 56.9169 81.0321 94.6986 88.1935 63.2297 39.7834 54.3114 77.8655 83.7193 71.2416 59.1472 68.7824 84.3572 87.3136 77.6534 67.4833 67.8718 13.2631 
146.689 218.488 201.245 123.701 25.4801 90.6704 157.665 175.701 144.885 80.9397 31.3954 79.9691 117.096 117.13 81.3437 26.3688 47.7466 91.8566 104.79 82.9604 44.7487 57.1169 97.0992 112.488 93.5962 52.5886 50.6511 95.0397 122.113 116.112 79.4966 5.5079 
102.4 155.641 151.394 108.594 50.8675 47.6717 91.9361 118.035 117.567 93.3428 55.0749 33.5751 61.6834 87.7893 91.9695 71.618 35.9575 33.2888 68.481 90.0794 88.8212 67.6337 41.9607 46.508 71.9427 88.5268 87.6489 69.9509 46.1619 46.242 70.8464 9.36254 
34.4156 54.0263 56.9847 49.0863 35.3998 20.9547 9.24463 7.27171 18.2382 31.8294 44.1281 51.5365 51.8023 45.0056 33.7752 23.2334 20.1004 24.2334 29.7221 34.6645 38.8082 41.2597 40.8957 37.5789 32.7977 29.3099 29.2334 31.9156 35.2312 37.5899 38.0361 2.21974 
40.9037 64.9213 70.1631 63.1416 49.1762 33.5443 19.6538 9.43284 15.4407 32.3444 50.2068 64.2785 71.0845 69.3805 60.8199 49.9308 42.8255 42.5506 45.8967 49.2085 51.8636 54.2701 55.6642 54.2329 48.6788 39.3949 28.9359 22.3284 23.7702 29.5905 35.3582 4.19653 
57.5473 92.1659 101.489 94.0083 75.9172 53.3149 30.7806 13.2755 23.1736 47.0268 71.5593 91.98 104.65 108.27 104.738 98.664 94.8953 94.9755 96.6738 97.41 96.6487 95.199 93.1937 89.2938 82.0402 71.9819 63.1102 61.6357 69.3767 81.2006 91.5236 22.7418 
62.3429 100.353 111.723 105.546 88.4619 67.5443 48.846 35.6827 30.0666 35.558 50.1338 66.7327 79.6957 86.0045 85.6064 81.1543 76.5158 74.1549 73.6704 73.5643 73.5758 74.4549 75.9415 75.957 72.1093 63.6394 52.4431 43.0907 40.4553 44.0908 49.559 8.31654 
251.064 409.699 470.061 467.772 424.73 360.326 286.405 204.244 110.228 32.5041 127.934 237.513 325.353 378.409 392.566 373.066 331.745 281.052 227.726 172.662 124.001 121.658 182.541 261.076 326.928 365.571 372.001 348.686 302.807 242.728 175.907 13.2454 
45.1352 72.9093 81.7944 78.3174 67.1491 53.2507 40.7399 31.4782 26.3752 29.1484 40.9455 56.3666 69.8777 77.731 78.2043 71.7871 61.063 50.1868 43.5245 42.7944 46.0653 51.1716 57.2538 63.4674 68.2434 69.8746 67.4388 61.3508 53.4579 46.7029 43.9352 2.99011 
37.2365 62.0147 73.8657 77.0182 72.9132 62.9423 49.1327 35.2408 29.3606 37.6201 52.2631 66.2744 76.6245 81.8869 81.5175 75.7324 65.6137 53.5514 44.3397 44.8237 56.1372 72.4371 88.8506 102.713 112.604 117.895 118.591 115.263 108.986 101.247 93.7535 28.8658 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
];


database_data = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
2.82095 2.71888 1.05078 2.34252 2.4494 1.93877 1.30106 2.91171 4.13131 3.67493 3.86216 4.48139 4.64754 5.11155 5.59118 5.91168 5.30614 4.5713 4.62461 4.01131 4.72296 6.09915 6.68588 6.99043 6.22811 6.40808 7.1605 5.90295 6.28485 7.47224 6.88133 0.278405 
4.51352 4.37583 3.03351 2.50936 1.59078 3.00395 4.3151 5.05278 5.26247 5.26657 3.76724 4.80564 3.43251 5.11793 6.87887 6.76232 7.27575 5.79817 6.36587 6.19281 7.1108 7.72719 7.45951 8.4136 7.60302 8.00236 8.91435 7.90093 5.99562 7.82002 8.3511 0.00862025 
5.92399 5.81178 3.60897 4.04714 4.20161 2.64288 3.62816 4.4592 3.21119 4.83166 7.67804 8.29567 5.85335 5.05609 6.74409 7.47744 4.40506 5.82373 5.51415 7.30521 8.44544 9.69722 10.5707 7.9374 9.14389 8.81561 9.65227 8.97797 8.37823 9.09039 11.1833 1.10513 
15.2331 11.8794 4.409 6.86052 7.89682 12.5958 8.57459 4.95727 8.24852 8.87362 4.96921 5.38251 5.65659 8.51927 9.96464 11.1853 11.3754 9.9868 6.60133 6.39966 5.81032 9.29741 7.41282 11.1453 9.03586 17.1439 20.8918 17.311 21.1726 17.0305 19.3898 8.33987 
19.1824 17.1675 4.1184 7.58657 4.36668 6.14147 11.0814 14.2718 12.2641 7.45566 8.95842 13.9725 15.1209 11.7465 5.30262 7.195 5.89326 8.44356 15.4626 17.5792 15.984 13.0326 7.97398 7.54947 7.33678 9.52504 9.48532 10.7815 9.10984 15.9249 13.277 2.35743 
24.2602 23.7696 12.5871 8.16758 5.15648 10.4993 4.79862 8.23136 12.7306 13.961 11.8864 8.82278 9.77237 14.9748 19.8805 18.4565 14.1027 11.3455 7.48193 9.31975 8.92492 11.9896 16.4783 19.4107 21.3532 19.789 13.7093 11.9607 10.0793 10.163 10.2249 1.46704 
54.4443 56.0591 38.4171 30.6995 6.97713 14.2766 17.6827 20.6405 15.4517 14.4034 9.31614 9.79262 10.4929 13.0067 13.6952 17.5649 25.2727 29.0543 28.2986 25.2539 21.4558 17.6626 13.9089 14.6671 14.8021 18.4755 22.7607 23.6291 23.3661 22.7053 21.4427 3.70897 
17.772 20.5784 13.292 4.922 9.97846 16.6693 21.0852 20.6221 18.6683 13.8385 9.7517 11.3038 15.0259 17.4383 17.5844 14.6572 9.37575 9.82657 11.4312 14.0781 15.4751 15.6311 13.0548 10.2531 9.40928 11.4021 14.5444 14.8798 12.5471 12.2542 11.1781 2.08625 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
16.9257 23.3661 22.9981 22.9994 20.6229 18.957 19.212 17.3767 16.7899 15.9802 12.5982 11.9173 11.7453 9.87955 10.8791 16.3587 21.6005 20.174 14.2468 13.819 11.9448 8.9464 15.8721 18.7762 18.7476 19.9404 16.6206 13.5682 17.0158 16.3037 12.8974 0.935712 
477.586 523.202 475.442 438.906 336.285 291.417 178.99 158.023 69.5971 89.9077 58.3927 81.3111 58.7578 61.3274 58.6275 71.6584 61.8802 67.1865 63.7385 61.0102 42.2969 45.7853 37.3472 40.5747 45.1858 49.7869 46.7953 55.6706 56.7031 72.3253 75.4857 17.8441 
746.987 783.044 603.943 503.344 223.924 211.449 179.893 266.113 286.482 278.012 217.106 187.199 97.0347 106.349 76.7011 97.5246 94.6978 134.054 100.831 96.6736 79.2212 77.6861 63.7828 74.2612 70.4888 77.9998 76.8973 83.1164 81.7452 88.2707 95.8849 30.8965 
223.983 229.359 92.0973 82.9437 146.996 186.389 189.431 167.015 112.762 80.1555 65.483 80.525 91.7618 95.8177 88.1142 72.6641 49.3139 48.2148 69.545 80.3447 67.6543 52.469 34.9341 47.2559 59.6388 60.4925 48.7208 44.0517 43.299 43.6631 46.6114 13.5536 
136.534 114.965 28.9764 104.426 156.241 133.74 39.7896 58.3374 107.508 108.455 56.5749 39.7119 59.6326 68.3858 40.7271 31.9838 39.5857 47.3909 32.9513 31.5089 43.0352 44.4892 28.2499 38.3248 47.6462 42.9921 27.715 37.9842 42.9408 42.1723 33.616 5.71697 
228.215 195.579 118.05 243.977 282.564 179.806 82.7258 202.747 253.522 171.113 101.773 187.285 208.709 153.746 110.602 154.993 164.74 130.344 113.239 147.467 146.96 121.163 110.728 140.671 143.35 112.908 110.694 144.464 143.196 117.766 106.132 21.6168 
209.314 172.052 119.799 236.202 229.047 114.865 112.273 197.87 166.611 78.0778 121.993 149.89 89.8678 87.4116 132.483 106.971 72.389 129.536 148.086 98.5751 99.3752 164.829 166.096 105.892 101.634 178.04 176.87 108.631 97.3841 168.099 163.392 28.3182 
93.9376 54.8687 109.103 117.176 27.2189 70.4875 97.0724 53.025 51.9329 68.5456 25.7711 35.2019 39.6819 29.1721 21.5288 27.778 23.0244 36.5072 41.4403 33.6934 45.9814 66.6631 38.7948 43.0134 80.2 56.2928 44.0933 72.6746 47.598 46.9859 62.0915 3.58 
256.424 151.002 322.836 357.701 60.5722 239.05 358.171 178.165 229.602 340.183 153.236 176.076 325.726 212.767 122.346 286.198 206.869 109.446 264.172 233.184 57.968 226.085 230.506 89.6544 206.548 239.626 74.7112 182.985 237.084 114.753 172.384 69.8341 
84.0642 44.9738 117.234 109.928 21.1596 84.4053 68.3399 23.4421 50.625 60.3471 52.4181 50.5299 65.3013 72.97 48.3869 60.9036 92.4527 60.174 61.6467 88.8204 58.0224 54.7624 94.9387 71.6979 62.2875 87.2709 82.3518 61.6455 84.4249 87.5477 63.788 16.1473 
142.458 78.0444 205.052 199.268 39.7859 174.231 145.512 61.9985 157.333 135.798 35.6628 117.346 89.1739 51.1454 65.8996 79.3393 46.0046 45.6431 68.7108 81.0142 40.6248 69.902 114.87 69.1601 90.0229 135.022 71.4306 94.364 151.951 87.8786 111.19 55.9282 
105.221 52.6622 162.562 144.012 56.4601 149.037 94.6353 73.6599 144.68 96.6155 75.4465 121.495 47.0425 68.4444 93.4581 61.2055 53.5411 77.9237 40.9974 42.0468 60.7758 53.8328 32.2371 56.174 62.8426 32.3937 67.4356 71.748 37.3237 71.3435 78.5095 3.66224 
32.4409 11.9727 60.4571 37.1422 48.8893 54.4629 14.6261 53.1855 27.2506 33.4761 54.1948 17.3825 57.9181 38.7827 39.5229 54.3766 18.691 52.6496 35.7438 40.3117 51.5163 37.7179 49.1348 48.4801 33.4772 53.1197 28.2101 45.3053 41.9502 33.1885 48.2721 6.77896 
39.7754 13.3788 76.1585 42.6229 67.1679 65.0904 29.6817 68.2257 20.4097 49.0006 60.2281 17.5674 77.9675 31.827 70.4793 59.2555 50.7449 69.298 48.7498 62.7718 64.2383 52.4623 68.9526 52.915 54.6127 58.0381 29.4006 54.8979 26.1154 42.757 45.4043 8.14466 
57.5473 18.2616 111.201 59.6484 100.89 92.8962 49.7044 100.594 25.9789 77.3264 86.8 35.1278 122.447 44.8345 125.337 89.0185 108.606 113.885 100.021 114.737 108.577 102.463 111.181 94.1432 93.7586 93.7287 68.3643 90.327 70.2661 81.3108 93.586 10.6425 
54.1622 16.1773 107.098 53.7878 104.522 86.1288 66.08 98.0696 14.2164 83.3209 49.0063 46.8209 83.8659 22.8254 91.5101 59.206 78.128 87.6477 69.1584 95.139 85.1608 87.2046 104.407 80.5555 105.762 87.0567 85.7116 96.7177 55.6525 96.5171 44.7722 36.9821 
235.549 67.0697 473.97 228.994 485.525 382.402 345.356 467.619 115.008 451.122 148.12 333.498 346.407 157.888 440.062 137.287 407.776 292.704 270.074 385.848 112.994 379.541 199.868 286.421 334.678 174.58 379.202 197.955 317.932 301.266 180.423 146.708 
43.1605 15.8424 85.8862 43.6209 85.2092 69.1415 55.9523 80.8648 17.4742 73.6246 44.8917 51.239 78.8709 35.692 90.9621 55.1313 78.4146 79.6555 49.2306 90.4963 34.3458 86.2501 59.9026 76.2221 83.6899 74.7209 90.2009 82.9274 80.5402 87.4366 66.482 20.0367 
28.2095 7.71398 55.4914 25.9422 53.452 42.1514 34.1196 49.7661 23.2935 47.4382 44.6387 42.0641 62.0885 46.8741 62.6451 61.5197 47.1048 74.3249 32.8792 79.3493 49.9302 77.8338 75.8961 74.9692 90.6655 73.7162 89.8994 71.3042 78.4214 64.6463 68.2741 2.15828 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
];


subplot(121),
bar3(input);view([90,-30,60]);set(gcf,'renderer','zbuffer'); %set(gca, 'ZLim', [0.0 600000.0]);
title('Spherical Harmonics Descriptors of The Rotated Model'); xlabel('Frequency'); ylabel('Radius');zlabel('Energy');
subplot(122),
bar3(database_data);view([90,-30,60]);set(gcf,'renderer','zbuffer');  %set(gca, 'ZLim', [0.0 600000.0]);
title('Spherical Harmonics Descriptors of The Origin Model'); xlabel('Frequency'); ylabel('Radius');zlabel('Energy');

