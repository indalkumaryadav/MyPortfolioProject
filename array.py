# reverse array

def reverArray(array):
    arr=[]
    for i in range(len(array)-1, -1, -1):
        arr.append(array[i]) 
    return arr
# print(reverArray([1,2,3,4,5]))


# Array Find the maximum and minimum element in an array

def findMax(arr):
    max=arr[0]
    for x in arr:
        if x>max:
            max=x
    return max

def findMin(arr):
    min=arr[0]
    for x in arr:
        if x < min:
            min=x
    return min

# wap to accept and display an array
def displayArray():
    number=int(input("Enter number of array:-"))
    list=[]
    for i in range(number):
        array=input(f"Enter element of array {i} = ")
        list.append(array)
    return f"Array:- "+str(list)

# wap to find sum of element of the array

def sumFind(arr):
    sum=0
    for i in arr:
        sum=i+sum
    return sum


def countArray(arr):
    count = 0
    for i in arr:
        count=len(arr)
    return count

def searchArray(array,element):
    for i in array:
        if i == element:
            element=i
    return element


def countElementFreq(array,element):
    count =0
    for i in array:
        if i == element:
            count= count+1
    return count

def arrayAsc(array):
    temp=[]
    num=0
    for i in array:
        if i>num:
            temp.append(i)
    return temp


print(arrayAsc([20,80,30,40,50,60]))