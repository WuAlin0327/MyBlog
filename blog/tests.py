from django.test import TestCase

# Create your tests here.
import time

# 递归实现二分查找法
# li = [i for i in range(1000)]
#
# def find_num(dataset,num):
#     if len(dataset) > 1:
#         mid = int(len(dataset)/2)
#         if dataset[mid] == num:# 找到数字了
#             print('找到数字了',num)
#         elif dataset[mid] > num:
#             return find_num(dataset[0:mid],num)
#         elif dataset[mid] < num:
#             return find_num(dataset[mid+1:],num)
#     else:
#         if dataset[0] == num:
#             print('找到该数字了')
#         else:
#             print('该数字不在数组内')
#
#
# start_time = time.time()
# find_num(li,2)
# end_time = time.time()
# print(start_time-end_time)
#
#
# start_time = time.time()
# for i in li:
#     if i == 1:
#         break
# end_time = time.time()
# print(start_time-end_time)

# 装饰器
# def func(f):
#     def inner():
#         print(111)
#         print('在装饰器里面')
#         print(222)
#         f()
#     return inner
#
# @func
# def func2():
#     print('in fun2')
#
#
# func2()

class Foo:
    def __init__(self,name,age,sex):
        self.name = name
        self.age = age
        self.sex = sex
    def get_self_name(self):
        return self.name

f = Foo('wu',19,1)


