#'hello’를 한 문자씩 출력하기
print('#1')
s = 'hello'
for char in s:
    print(char,end =' ')
print()
#리스트 자료형에 저장된 데이터 출력하기
print('#2')
list = [10,20,30]
print('list: ',list)
for i in list:
    print(i)
print()
#딕셔너리에 저장된 키와 값을 분리해서 출력하기
print('#3')
stu_dict={'Kim':10,'Hong':20,'Gil':30,'Dong':40}
print('딕셔너리: ',stu_dict)
print('키:')
for i in stu_dict.keys():
    print(i)
print('값:')
for i in stu_dict.values():
    print(i)
print()
#1~10까지 출력하기
print('#4')
for i in range(1,11):
    print(i)
print()
#1부터 36590까지의 숫자 중에 짝수, 홀수 각각의 개수와 총합 구하기
print('#5')
l_od =[] #홀수 저장
l_ev =[] #짝수 저장
for i in range(1,36951):
    if i%2==0:
        l_ev.append(i)
    else:
        l_od.append(i)
print('짝수의 개수: ',len(l_ev))
print('홀수의 개수: ',len(l_od))
print('총합: ',len(l_ev)+len(l_od))
print()
#사용자가 입력한 횟수만큼 ‘수행완료!’ 문자열 출력하기
print('#6')
exec = int(input('수행의 횟수 입력: '))
for i in range(exec):
    print('‘수행완료!’')
print()
#구구단 5단 출력하기
print('#7')
print('구구단을 외우자! 구구단을 외우자! 5단!')
for i in range(1,11):
    print('5 x',i,'=',5*i)
print('5단 끝!')
print()
