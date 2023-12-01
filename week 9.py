#변수에 정수, 실수 데이터를 각각 할당하고 각 변수의 자료형을 보이시오.
print("#1")
a = 5
b= 5.5
print("a는 ",type(a),"b는",type(b))
print("")

#변수에 문자형 데이터와 논리형 데이터를 각각 할당하고 각 변수의 자료형을 보이시오.
print("#2")
a = "a"
b = True
print("a는 ",type(a),"b는",type(b))
print("")
#'2’ 를 문자형으로 변수에 할당하고, 변수를 정수형으로 변환 하시오.
print("#3")
a = '2'
a=int(a)
print("a는 ",type(a))
print("")
#'400’을 정수형으로 변수에 할당하고, 변수를 실수형으로 변환 하시오.
print("#4")
a = 400
a = float(a)
print("a는 ",type(a))
print("")
#a=12.5 , b=25.4 로 선언 했을 때, a+b 와 int(a)+int(b) 를 수행 후 수행 결과를 보이시오.
print("#5")
a=12.5
b=25.4
print("a+b = ",a+b," int(a)+int(b) = ",int(a)+int(b))
print("")
#a=‘6’, b=‘7’ 로 할당하고, 정수 6과 정수7 합을 보이는 프로그램을 작성하시오.
print("#6")
a= '6'
b= '7'
def add(a,b):
    return int(a)+int(b)

print("정수 6과 정수7의 합 = ",add(a,b))
print("")

print("#7 문자열 실습")
s = "Monty Python"
def stringfunc(s):
    print("문자열의 길이는 ",len(s)) #문자열의 길이는?
    count = s.count('o')
    print(f"문자 \"o\" 의 개수는 {count}") #문자 ”o”의 개수는?
    print("문자 “P”의 인덱스는 ",s.index('P')) #문자 “P”의 인덱스는?
    print("문자열을 대문자로 변환 : ",s.upper(),"문자열을 소문자로 변환: ",s.lower()) #문자열을 대문자/소문자로 변환 하시오.
    print("원래 문자열: ",s,"바뀐 문자열: ",s.replace(" ","-")) #공백 문자를 “-” 로 변경 하시오

stringfunc(s)
print("")

print("#8 LIST 실습")
score = [88,75,95,90,82,99,88,79,85]
def listfunc(list):
    print("주어진 리스트의 길이: ",len(list)) #주어진 리스트의 길이를 보이시오.
    print("주어진 리스트의 최대값: ",max(list),"주어진 리스트의 최소값: ",min(list)) # 주어진 리스트의 최대값/최소값 을 보이시오.
    print("리스트에 저장된 요소들의 총합: ",sum(list)) # 리스트에 저장된 요소들의 총합을 구하시오.
    score2 =list
    print("같은 리스트 데이터를 할당한 score2 = ",score2) # 같은 리스트 데이터를 할당한 score2 를 생성 하시오.

listfunc(score)
    

