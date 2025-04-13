import torch
import time

def check_gpu():
    if torch.cuda.is_available():
        print("CUDA is available.")
        print(f"GPU Name: {torch.cuda.get_device_name(0)}")
        print(f"Total GPU Memory: {torch.cuda.get_device_properties(0).total_memory // (1024**2)} MB")
        print(f"Initial Memory Allocated: {torch.cuda.memory_allocated() // (1024**2)} MB\n")
    else:
        print("CUDA is NOT available. Exiting.")
        exit()

def run_tensor_benchmark(iterations=10, inner_loops=20):
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Running on device: {device}")
    print(f"Starting benchmark with {iterations} outer iterations, {inner_loops} inner loops each...\n")

    size = 6000
    total_time = 0

    for i in range(1, iterations + 1):
        a = torch.rand((size, size), device=device)
        b = torch.rand((size, size), device=device)

        start = time.time()
        result = a
        for _ in range(inner_loops):
            result = torch.matmul(result, b)
            result = torch.nn.functional.relu(result)

        torch.cuda.synchronize()
        end = time.time()

        iter_time = end - start
        total_time += iter_time
        mem_alloc = torch.cuda.memory_allocated() // (1024**2)

        print(f"[{i}/{iterations}] Time: {iter_time:.2f}s | GPU Mem: {mem_alloc} MB")

    print(f"\nFinished {iterations} iterations.")
    print(f"Total time: {total_time:.2f}s | Avg per iteration: {total_time/iterations:.2f}s")

if __name__ == "__main__":
    check_gpu()
    run_tensor_benchmark(iterations=10, inner_loops=30)
