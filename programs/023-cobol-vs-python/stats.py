#!/usr/bin/env python3

nums = [int(input()) for _ in range(10)]

total = sum(nums)
print(f"Sum: {total}")
print(f"Avg: {total / 10:.2f}")
print(f"Min: {min(nums)}")
print(f"Max: {max(nums)}")