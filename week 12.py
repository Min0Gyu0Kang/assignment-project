#WHILE
#'10,9,8,....,1”과 같이 카운트를 한 뒤 마지막 “발사” 메시지를 출력하는 카운트 프로그램을 작성 하시 오.
print('#1')
i=10
while(i>=1):
    print(i)
    i=i-1
print('발사!!!')
print()
#1~200까지의 숫자 중 5배씩 증가하는 값을 출력하는 프로그램을 작성 하시 오.
print('#2')
i=1
print(i)
while(i<=200 and i*5<=200):
    print(i*5)
    i=i*5
print()
# 1~10까지의 합 계산하기
print('#3')
i=1
sum=0
while(i<=10):
    sum+=i
    i=i+1
print('1~10까지의 합: ',sum)
print()
# 1 ~ 30 까지의 정수 중 홀수와 짝수를 구분하여 출력하기
print('#4')
i=1
print('1~30 중 홀수와 짝수')
while(i<=30):
    if i%2!=0:
        print('홀: ',i)
    else:
        print('짝: ',i)
    i=i+1
print()
# 구구단 출력하기 (원하는 단 입력)
print('#GUGUDAN')
dan = int(input('원하는 단 입력: '))
while(dan<=9):
    i=1
    print('==',dan,'단==')
    while(i<=9):
        print(dan,'x',i,'=',dan*i)
        i+=1
    dan+=1
        
