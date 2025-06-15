#include <iostream>
#include <cuda_runtime.h>
using namespace std;

__global__ void add_one(int* data, int n){
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < n) {
        data[idx] += 1;
    }
}

int main(){
    const int N = 8;
    int h_data[N] = {0, 1, 2, 3, 4, 5, 6, 7};
    int *d_data;

    cudaMalloc((void**)&d_data, N * sizeof(int));

    cudaMemcpy(d_data, h_data, N * sizeof(int), cudaMemcpyHostToDevice);

    add_one<<<1, N>>>(d_data, N);

    cudaMemcpy(h_data, d_data, N * sizeof(int), cudaMemcpyDeviceToHost);

    for(auto item: h_data) {
        cout << item << " ";
    }
    cout << endl;
    return 0;
}
