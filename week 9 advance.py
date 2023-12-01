'''
5명의 학생의 컴퓨팅사고 성적을 다음 입력 형식으로 외
부 입력 받아 다음 형식으로 표준 출력하는 코드를 작성 하시오. (컬렉션 자료
형 사용) = list, tuple
'''
sc=['','','','','']
sc[0]=int(input("학생1 성적: "))
sc[1]=int(input("학생2 성적: "))
sc[2]=int(input("학생3 성적: "))
sc[3]=int(input("학생4 성적: "))
sc[4]=int(input("학생5 성적: "))

print("컴퓨팅 사고 성적(정렬하여): ",sorted(sc))
print("컴퓨팅 사고 성적 합계: ",sum(sc))
print("컴퓨팅 사고 성적 평균: ",sum(sc)/len(sc))

