def getSumPairZero(arr):
    for x in arr:
       for y in arr:
           if(x+y==0):
               return y

# result=getSumPairZero([-5, -4, -3, -2,  2, 4, 6, 8])
# print(result)
# print(getSumPairZero([-5, -4, -3, -2,  2, 4, 6, 8]))


# better way
def getSumZero(arr):
    left=0
    right=len(arr)-1

    while(left<right):
        sum= arr[left]+ arr[right]
        if(sum == 0):
            print(arr[left],arr[right])
            break
        elif (sum>0):
            right-=1
        else:
            left+=1
        
        
# print(getSumZero([-5, -4, -3, -2,  2, 4, 6, 8]))
# print(getSumZero([-5, -4, -3, -2,  2, 4, 6, 8]))