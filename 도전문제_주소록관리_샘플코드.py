#함수정의

def search(a):
    if a in add_dic:
        return add_dic[a]
    else:
        return 0

def modify(a,b):
    if a in add_dic:
        add_dic[a]=b
        return 1
    else:
        return 0
def delete(a):
    if a in add_dic:
        del add_dic[a]
        return 1
    else:
        return 0

#반복실행

#자료형 생성하여 기본연락처 등록하기
#함수에서도 사용해야 하므로 전역변수로 생성
#선택된 기능에 따라 함수 수행하여 결과보기

add_dic={'박세리':'010-222-2222','박찬호':'010-333-3333','김연아':'010-444-5555'}

while True:
    
    print('실행가능기능\n1:검색\n2:수정\n3:삭제\n4:종료')
    func=int(input('실행할 기능선택:'))
    
    if func==1:
        name=input('검색할 이름을 입력하세요:')
        result=search(name)

        if result==0:
            print('not found')
        else:
            print('{0} 전화번호:{1}'.format(name,search(name)))

    elif func==2:
        name=input('수정할 이름을 입력하세요:')
        modi_tel=input('새 전화번호를 입력하세요:')
        result=modify(name,modi_tel)

        if result==0:
            print('not found')
        elif result==1:
            print('{0}의 전화번호가 {1}로 변경되었습니다.'.format(name,modi_tel))

    elif func==3:
        name=input('삭제할 이름을 입력하세요:')
        result=delete(name)

        if result==0:
            print('not found')
        elif result==1:
            print('{0}의 연락처가 삭제되었습니다.'.format(name))
    elif func==4:
        print('종료')
        break
        
