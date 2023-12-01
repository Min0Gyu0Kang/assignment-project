#a=8, b=3 일 때, 다음 연산결과를 보이시오.
#a==b,a!=b, a>b, a<b,a>=7,a<=b
print('#2')
a=8
b=3
print('a: ',a)
print('b: ',b)
print('a==b: ',a==b)
print('a!=b: ',a!=b)
print('a>b: ',a>b)
print('a>=7: ',a>=7)
print('a<=b: ',a<=b)

#a=37, b=7 일 때,a 와 b 값의 변화를 확인 하시오.
#a+=b, a-=b, a*=b,a/=b,a**=7,a//=b,a%=b
print('#3')
a=37
b=7
print('a: ',a)
print('b: ',b)
a+=b
print('a+=b, a:',a,'b:',b)
a=37
b=7
a-=b
print('a-=b, a:',a,'b:',b)
a=37
b=7
a*=b
print('a*=b, a:',a,'b:',b)
a=37
b=7
a/=b
print('a/=b, a:',a,'b:',b)
a=37
b=7
a**=7
print('a**=7, a:',a,'b:',b)
a=37
b=7
a//=b
print('a//=b, a:',a,'b:',b)
a=37
b=7
a%=b
print('a%=b, a:',a,'b:',b)

#딕셔너리 자료형
'''
년도 매출액
2017 1520
2018 2380
2019 990
2020 1300
2021 990
'''
print('#딕셔너리')
dict1={'2017':1520,'2018':2380,'2019':990,'2020':1300,'2021':990}

print('2019년 매출액: ',dict1['2019']) #저장된 데이터를 이용하여 2019년 매출액을 조회 하시오
dict1.update({'2022':1500})#2022년 매출액 1500을 추가 저장하시오.
print('2022년 매출액: ',dict1['2022'])
dict1.update({'2019':1700})#저장된 데이터에서 2019년 매출액을 1700으로 수정하시오.
print('2019년 수정된 매출액: ',dict1['2019'])
print('매출 총액: ',sum(dict1.values()),'평균매출:',sum(dict1.values())/len(dict1))#저장된 데이터를 이용하여 매출 총액과 평균매출을 계산하여 출력하시오.
