#로그인 기능 만들기
'''
관리자가 암호를 입력하고 로그인을 시도할 때 암호가 틀렸다면 ‘암호를
다시 입력하세요!’를 출력하고 다시 암호를 물어본다.

5회이상 로그인에 실패하면 ‘로그인 실패!’ 메시지를 출력하고 종료한다.

암호가 올바르면 ‘로그인 되었습니다.’ 를 출력하고 종료한다.

주어진 암호는 ‘SKKU’ 입니다.
'''
pw = 'SKKU' # 모두 대문자여야 정답입니다
print('로그인 화면입니다')
do = input('암호를 입력하세요: ')
lock = 0
for i in range(5):
    if do == pw:
        print('로그인 되었습니다.')
        break
    else:
        if lock != 4:
            lock += 1
            print('암호를 다시 입력하세요! 틀린 횟수:', lock)
            do = input('암호를 입력하세요: ')
        else:
            lock+=1
            print('틀린 횟수:', lock)
            print('로그인 실패!')
            break

        
