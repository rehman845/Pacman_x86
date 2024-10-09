;Awab Ur Rehman, 22i-1068, CS-C
;COAL PROJECT

INCLUDE Irvine32.inc
INCLUDE macros.inc
Includelib Winmm.lib

.386
.model flat, stdcall
.stack 4096
buff_SIZE = 5000


.data

	namFl BYTE "ScoreRecord.txt",0
	buff byte buff_SIZE dup(?)
	handFl Handle ?
	strDeNam BYTE 1000 dup(?)
	midSz DWORD ?
		

bLength = 82
bHeight = 28

isGleft  db 1
isGleft2 db 1
isGleft3 db 1

isGleft11  db 1
isGleft22 db 1
isGleft33 db 1

isGleft111  db 1
isGleft222 db 1
isGleft333 db 1

PlaySoundA PROTO,
pszSound:PTR BYTE,
hmod:DWORD,
fdwSound:DWORD


SND_ASY equ 00000001h
SND_NOWAIT equ 0002000h

;pacSound BYTE ".\Sound\pacmannn.wav", 0
Gorgeous BYTE ".\Sound\Gorgeous.wav", 0


pacMaize db "##################################################################################"
         db "#................................................................................#"
         db "#.........#...........................................................#..........#"
         db "#.........#...........................................................#..........#"
         db "#.........#...........................................................#..........#"
         db "#......####.........#######################################...........####.......#"
         db "#................................................................................#"
         db "#................................................................................#"
         db "#.........#...........................##...............................#.........#"
         db "#.........#...........................##...............................#.........#"
         db "#.........###################.........##.........#######################.........#"
         db "#.........#...........................##...............................#.........#"
         db "#.........#...........................##...............................#.........#"
         db "#...............##################################################...............#"
         db "#...............##################################################...............#"
         db "#.........#...........................##...............................#.........#"
         db "#.........#...........................##...............................#.........#"
         db "#.........###################.........##.........#######################.........#"
         db "#.........#...........................##...............................#.........#"
         db "#.........#...........................##...............................#.........#"
         db "#................................................................................#"
         db "#................................................................................#"
         db "#......####..........#######################################...........####......#"
         db "#.........#............................................................#.........#"
         db "#.........#............................................................#.........#"
         db "#.........#............................................................#.........#"
         db "#................................................................................#"
         db "##################################################################################",0




pacMaiz2 db "##################################################################################"
         db "#................................................................................#"
         db "#.......#############........#########################.......#############.......#"
         db "#.......#...........#........................................#...........#.......#"
         db "#.......#.....#....................................................#.....#.......#"
         db "#.......#.....#..............#########################.............#.....#.......#"
         db "#.......#.....#....................................................#.....#.......#"
         db "#.......#........%..#........................................#...........#.......#"
         db "#.......#############..................##....................#############.......#"
         db "#......................................##........................................#"
         db "#.........#.............#################################..............#.........#"
         db "#.........#............................##..............................#.........#"
         db "#.........#............................##..............................#.........#"
         db "#....%..........##################################################...............#"
         db "#...............##################################################...............#"
         db "#.........#............................##..............................#.........#"
         db "#.........#............................##..............................#.........#"
         db "#.........###################..........##..........#####################.........#"
         db "#.........#............................##..............................#.........#"
         db "#.........#............................##..............................#.........#"
         db "#.........#............................##......................%.......#.........#"
         db "#.........#............................................................#.........#"
         db "#.........#..........#######################################...........#.........#"
         db "#.........#............................................................#.........#"
         db "#.........#............................................................#.........#"
         db "#.........##############################################################.........#"
         db "#................................................................................#"
         db "##################################################################################",0



pacMaiz3 db "##################################################################################"
         db "#................................................................................#"
         db "#...##############################..............##############################...#"
         db "#...#........................................................................#...#"
         db "#...#...##########################..............##########################...#...#"
         db "#...#...#................................................................#...#...#"
         db "#...#...#...######################..............######################...#...#...#"
         db "#.. #...#...#%.......................................................#...#...#...#"
         db "#...#...#...#........................................................#...#...#...#"
         db "#...#...#...#...........................%............................#...#...#...#"
         db "#...#...#...#...........################################.............#...#...#...#"
         db "#...#...#...#..........................##............................#...#...#...#"
         db "#......................................##........................................#"
         db " ...............##################################################............... "
         db "#...............##################################################...............#"
         db "#...#...#...#..........................##............................#...#...#...#"
         db "#...#...#...#..........................##............................#...#...#...#"
         db "#...#...#...#...........################################.............#...#...#...#"
         db "#...#...#...#..........................##............................#...#...#...#"
         db "#...#...#...#..........................##............................#...#...#...#"
         db "#...#...#...#...........################################............%#...#...#...#"
         db "#...#...#...#########...................%..................###########...#...#...#"
         db "#...#...#................................................................#...#...#"
         db "#...#...#############......................................###############...#...#"
         db "#...#........................................................................#...#"
         db "#...##########################################################################...#"
         db "#................................................................................#"
         db "##################################################################################",0


max db 200 dup (?)

pacDisp db   "                                  ________    ________   _________   ________                                       ", 13, 10
        db   "                                    //       /   /_______   /________       /                                           ", 13, 10
        db   "                                   //       /   /                   /      /                                            ", 13, 10
        db   "                                  //_______/   /________   ________/   ___/____                                         ", 13, 10
        db   "                                                                                                               ", 13, 10
        db   "       -//-----------//   //-----------//   //-----------//   //-----/  /-----//   //-----------//   //-----------//", 13, 10
        db   "       //           //   //           //   //                //      //      //   //           //   //           //", 13, 10
        db   "      //           //   //           //   //                //      //      //   //           //   //           //", 13, 10
        db   "     //-----------//   //-----------//   //                //      //      //   //-----------//   //           //", 13, 10
        db   "    //                //           //   //                //      //      //   //           //   //           //", 13, 10
        db   "   //                //           //   //____________//  //      //      //   //           //   //           //", 13, 10,0


pacMenu db   "                         _________          __________          _________          __________         ",13,10
        db   "                        |         |        |          |        |         |        |          |        ",13,10
        db   "                        |  START  |        |   HELP   |        |  SETUP  |        |   EXIT   |        ",13,10
        db   "                        | Press S |        |  Press H |        | Press T |        |  Press X |        ",13,10 
        db   "                        |_________|        |__________|        |_________|        |__________|        ",13,10,0

Nam BYTE "Enter your name: ",0
        
pauseScreen  db   "       -//-----------//   //-----------//   //            //  //-------------    //===========    //--------------  ", 13, 10
             db   "       //           //   //           //   //            //  //                 //               //             /   ", 13, 10
             db   "      //           //   //           //   //            //  //_____________    //===========    //             /    ", 13, 10
             db   "     //-----------//   //-----------//   //            //                //   //               //             /     ", 13, 10
             db   "    //                //           //   //            //                //   //               //             /      ", 13, 10
             db   "   //                //           //   //____________//   _____________//   //============   //_____________/       ", 13, 10
             db   "                                                                                                                    ", 13, 10
             db   "                                              PRESS C TO CONTINUE                                                   ", 13, 10, 0


 
gamOver db   "           -//-----------//   //-----------//   //-----/  /-----//   //-----------     //           //  //---------/ ", 13, 10
        db   "           //                //           //   //      //      //   //                //           //  //         /  ", 13, 10
        db   "          //                //           //   //      //      //   //                //           //  //         /   ", 13, 10
        db   "         //      ======//  //-----------//   //      //      //   //-----------     //           //  //_________/    ", 13, 10
        db   "        //            //  //           //   //      //      //   //                //           //  //               ", 13, 10
        db   "       //____________//  //           //   //      //      //   //____________    //___________//  //                ", 13, 10,0

newNam db   "Your name ", 0
newScore db "Your score is", 0



pacHelp db "**Title: Pac-Man Game Instructions**",13,10     
db " ", 13, 10
db "**Objective:**", 13, 10
db "Navigate Pac-Man through the maze, eat all the dots, avoid ghosts, and clear the level.", 13, 10
db " ", 13, 10
db "**Controls:**", 13, 10
db "- Use the W,S,A,D keys (Up, Down, Left, Right) to control Pac-Man's movement.", 13, 10
db " ", 13, 10 
db "**Game Elements:**", 13, 10
db "1. **Pac-Man:** The main character you control.", 13, 10
db "2. **Dots:** Small pellets scattered throughout the maze. Eat all the dots to complete the level.", 13, 10
db "4. **Ghosts:** Enemies that roam the maze. Avoid them; if they touch Pac-Man, you lose a life.", 13, 10
db "5. **Fruit:** Bonus items that appear periodically. Eating them awards extra points.", 13, 10
db " ", 13, 10
db "**Scoring:**", 13, 10
db "- Eating dots: 1 points each.", 13, 10
db "- Eating ghosts: Points increase with each successive ghost", 13, 10
db "- Eating fruit: Varies depending on the type of fruit", 13, 10
db " ", 13, 10
db "**Gameplay:**", 13, 10
db "1. Navigate Pac-Man through the maze, eating all the dots to complete the level.", 13, 10
db "2. Avoid ghosts; if they touch Pac-Man, you lose a life", 13, 10
db "3. Eating a Power Pellet allows Pac-Man to eat ghosts for a short time.", 13, 10
db "4. Eat fruit for bonus points.", 13, 10
db "5. Clear all dots to advance to the next level.", 13, 10
db " ", 13, 10
db "**Lives:**", 13, 10
db "- You start with three lives. Losing all lives ends the game.", 13, 10
db "- Extra lives are earned at certain point thresholds", 13, 10
db " ", 13, 10
db "**Game Over:**", 13, 10
db "- The game ends when you run out of lives.", 13, 10
db "- Your final score is displayed.", 13, 10
db " ", 13, 10
db "Enjoy playing Pac-Man!", 13, 10,0


backToMenu db "Press B to go back to menu", 0ah, 0
temp byte ?

strScore BYTE "Your score is ",0
score dd 0

strLives BYTE "Lives ",0
lives dd 3

strLevel1 BYTE "Level",0
levelONETWOTHREE dd 1
strLevel2 BYTE "Level",0
strLevel3 BYTE "Level",0


xPos BYTE 83
yPos BYTE 5

tempX db 83
tempY db 5



xStartPos BYTE 3
yStartPos BYTE 1

xGPos BYTE 5
yGPos BYTE 2

GtempX db 5
GtempY db 2

xGPos2 BYTE 5
yGPos2 BYTE 27

GtempX2 db 5
GtempY2 db 27

xGPos3 BYTE 5
yGPos3 BYTE 3

GtempX3 db 5
GtempY3 db 3

inputChar BYTE ?

sizeName dd 0

.code



main PROC

mov edx , offset namFl 
call openInputFile 
mov handFl , eax 

mov eax , handFl 
mov edx , offset strDeNam 
mov ecx ,  1000 
call ReadFromFile
mov midSz , eax 

mov eax , handFl
call CloseFile 


;INVOKE PlaySoundA, ADDR pacSound, NULL, SND_ASY or SND_NOWAIT
;INVOKE PlaySoundA, ADDR Gorgeous, NULL, SND_ASY or SND_NOWAIT


mov eax, red
call SetTextColor
mov dl, 4
mov dh, 8
call gotoxy
mov edx, offset pacDisp
call Writestring

namloop:
mov eax, green
call SetTextColor
mov dl, 48
mov dh, 20
call gotoxy
mov edx, offset Nam

call Writestring
mov edx, offset max
mov ecx, 200
call Readstring
mov sizeName, eax


tempMenu:
mov eax, yellow
call SetTextColor
mov dl, 3
mov dh, 8
call gotoxy
mov edx, offset pacDisp
call Writestring

mov eax, red
call SetTextColor
mov edx, offset pacMenu
call Writestring

MenuLOOP:
call ReadChar
cmp al, "h"
je help

cmp al,"x"
je exitGame

cmp al, "s"
je cont

jmp MenuLOOP

   call ReadChar
         mov inputChar,al
         cmp al ,"h"
         je help
         jne cont
    
        help:
        call clrscr
        mov eax, cyan
        call SetTextColor
        mov edx, offset pacHelp
        call Writestring
        
        mov edx, offset backToMenu
        call Writestring
        call ReadChar
        call clrscr
        cmp al, "b"
        je tempMenu

        helpLoop:
        call ReadChar

        cont:
        call clrscr
       
        contAfterPause:
        call clrscr
        mov eax, red
        call SetTextColor
        
mov dl, xStartPos
mov dh, yStartPos
mov bl, dl
add bl, bLength  
sub bl, 1

mov esi, offset PacMaize
MaizePrint:

call gotoxy
mov al, byte ptr [esi]
cmp al, 0
je continueGame
call WriteChar
cmp dl, bl
jne dontskipnextline
inc dh
mov dl, xStartPos
inc esi
jmp MaizePrint
dontskipnextline:
inc esi
inc dl
jmp MaizePrint

continueGame:

    call DrawPlayer
    call DrawGhost

     gameLoop:

 ; draw score:

        mov dl,90
        mov dh,4
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov dl,95
        mov dh,5
        call Gotoxy
        mov eax, 0
        mov eax,score
        call WriteInt
        

        ; draw lives:
        mov dl,94
        mov dh,8
        call Gotoxy
        mov edx,OFFSET strLives
        call WriteString
        mov dl,95
        mov dh,9
        call Gotoxy
        mov eax, 0
        mov eax, lives
        call WriteInt

         ; draw level:
        mov dl,93
        mov dh,12
        call Gotoxy
        mov edx,OFFSET strLevel1
        call Writestring
         mov dl,96
        mov dh,13
        call Gotoxy
        mov eax, 0
        mov eax, levelONETWOTHREE
        call WriteInt
        

         call UpdateGhost

        ; get user key input:
        mov eax, 60
        call delay
        call ReadKey
        jz gameLoop
        mov inputChar,al

        cmp al, "p"
        je pauseGame
        

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight
        

        moveUp:
            mov eax,0
            dec yPos
            movzx ax,yPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, Xpos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaize[esi], '#'
            je yesWall
            
              cmp pacMaize[esi], "."
             je yesEat

            call UpdatePlayer

        jmp gameLoop

        moveDown:
            mov eax,0
            inc yPos
            movzx ax,yPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx,xPos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaize[esi], "#"
            je yesWall
          

              cmp pacMaize[esi], "."
             je yesEat
     
            call UpdatePlayer

        jmp gameLoop

        moveLeft:
       mov eax,0
            mov eax,0
            dec xPos
            movzx ax,yPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx,Xpos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx
            movzx esi, ax
            cmp pacMaize[esi], "#"
            je yesWall

             cmp pacMaize[esi], "."
             je yesEat
            
            call UpdatePlayer

        jmp gameLoop

        moveRight:
            mov eax,0
            inc xPos
            movzx ax, yPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx,xPos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx
            movzx esi, ax
            cmp pacMaize[esi], "#"
            je yesWall

             cmp pacMaize[esi], "."
             je yesEat

             cmp pacMaize[esi], "%"
             je yesFruit

            call UpdatePlayer

        jmp gameLoop

       
        yesWall:
        mov cl, tempX
        mov ch, tempY
        mov xPos, cl
        mov yPos, ch
        

        jmp gameLoop



        yesEat:
        cmp score, 50
        ;cmp score, 1753
        je level2
        inc score
        mov pacMaize[esi], " "
        call UpdatePlayer
        jmp gameLoop
       
       yesFruit:
        inc score
        inc score
        inc score
        inc score
        inc score
        
        mov pacMaize[esi], " "
        call UpdatePlayer
        jmp gameLoop
       

        pauseGame:

        call clrscr
        mov eax, yellow
        call SetTextColor
        mov dl, 0
        mov dh, 10
        call gotoxy
        mov edx, offset pauseScreen
        call Writestring
         call ReadChar
        mov inputChar,al
        cmp al, "c"
        je contAfterPause



    exitGame:






   
mov esi , offset strDeNam 
add esi , midSz 

mov bl , 0ah 
mov [esi] , bl 
add esi , 1 
inc midSz 


mov edi, 0
mov ecx,30
mov ecx, sizeName

handLoop : 
mov bl , max[edi]
mov [esi] , bl 

inc esi 
inc edi 
inc midSz 

loop handLoop
mov bl," "
mov [esi],bl
inc esi
inc midSz 
mov [esi],bl
inc esi
inc midSz 
mov eax, score
mov bl,100
div bl
OR al,30h
mov [esi],al
inc esi
inc midSz 
movzx eax,ah
mov bl,10
div bl
OR al,30h
mov [esi],al
inc esi
inc midSz 
OR ah,30h
mov [esi],ah
inc esi
inc midSz 

mov bl," "
mov [esi],bl
inc esi
inc midSz
mov eax, levelONETWOTHREE
mov bl,100
div bl
OR al,30h
inc ax
mov [esi],al
inc esi
inc midSz

mov  edx, OFFSET namFl
call CreateOutputFile
mov  handFl, EAX


mov  eax, handFl
mov  edx, OFFSET strDeNam
mov  ecx, midSz
call WriteToFile


mov  eax, handFl
call CloseFile



    call clrscr

    mov eax, red
    call SetTextColor
    mov dl, 0
    mov dh, 2
    call gotoxy
    mov edx, offset gamOver
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 57
    mov dh, 9
    call gotoxy
    mov edx, offset newNam
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 60
    mov dh, 10
    call gotoxy
    mov edx, offset max
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 55
    mov dh, 11
    call gotoxy
    mov edx, offset newScore
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 60
    mov dh, 12
    call gotoxy
    mov eax, 0
    mov eax, score
    call WriteInt


    exit


    level2:

     contAfterPause2:
        call clrscr
        mov eax, yellow
        call SetTextColor



mov dl, xStartPos
mov dh, yStartPos
mov bl, dl
add bl, bLength  
sub bl, 1

mov esi, offset PacMaiz2
MaizePrint2:

call gotoxy
mov al, byte ptr [esi]
cmp al, 0
je continueGame2
call WriteChar
cmp dl, bl
jne dontskipnextline2
inc dh
mov dl, xStartPos
inc esi
jmp MaizePrint2
dontskipnextline2:
inc esi
inc dl
jmp MaizePrint2

continueGame2:

  

   inc levelONETWOTHREE

     gameLoop2:

     ; draw :

        mov dl,90
        mov dh,4
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov dl,95
        mov dh,5
        call Gotoxy
        mov eax, 0
        mov eax,score
        call WriteInt
        

        ; draw lives:
        mov dl,94
        mov dh,8
        call Gotoxy
        mov edx,OFFSET strLives
        call WriteString
        mov dl,95
        mov dh,9
        call Gotoxy
        mov eax, 0
        mov eax, lives
        call WriteInt

          ; draw level:
       
        mov dl,93
        mov dh,12
        call Gotoxy
        mov edx,OFFSET strLevel1
        call Writestring
         mov dl,96
        mov dh,13
        call Gotoxy
        mov eax, 0
        mov eax, levelONETWOTHREE
        call WriteInt
        

         call UpdateGhost2



        ; get user key input:
        mov eax, 20
        call delay
        call ReadKey
        jz gameLoop2
        mov inputChar,al

        cmp al, "p"
        je pauseGame2
        

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame2

        cmp inputChar,"w"
        je moveUp2

        cmp inputChar,"s"
        je moveDown2

        cmp inputChar,"a"
        je moveLeft2

        cmp inputChar,"d"
        je moveRight2
        

        moveUp2:
            mov eax,0
            dec yPos
            movzx ax,yPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, Xpos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaiz2[esi], '#'
            je yesWall2
            
              cmp pacMaiz2[esi], "."
             je yesEat2

             cmp pacMaiz2[esi], "%"
             je yesFruit2
          
            call UpdatePlayer

        jmp gameLoop2

        moveDown2:
            mov eax,0
            inc yPos
            movzx ax,yPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx,xPos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaiz2[esi], "#"
            je yesWall2
          

              cmp pacMaiz2[esi], "."
             je yesEat2

             cmp pacMaiz2[esi], "%"
             je yesFruit2
     
            call UpdatePlayer

        jmp gameLoop2

        moveLeft2:
       mov eax,0
            mov eax,0
            dec xPos
            movzx ax,yPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx,Xpos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx
            movzx esi, ax
            cmp pacMaiz2[esi], "#"
            je yesWall2

             cmp pacMaiz2[esi], "."
             je yesEat2

             cmp pacMaiz2[esi], "%"
             je yesFruit2
            
            call UpdatePlayer

        jmp gameLoop2

        moveRight2:
            mov eax,0
            inc xPos
            movzx ax,yPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx,xPos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx
            movzx esi, ax
            cmp pacMaiz2[esi], "#"
            je yesWall2

             cmp pacMaiz2[esi], "."
             je yesEat2

             cmp pacMaiz2[esi], "%"
             je yesFruit2

            call UpdatePlayer

        jmp gameLoop2


        yesWall2:
        mov cl, tempX
        mov ch, tempY
        mov xPos, cl
        mov yPos, ch
        

        jmp gameLoop2


        yesEat2:
       ; cmp score, 1651
        cmp score, 150
       je level3
        inc score
        mov pacMaiz2[esi], " "
        call UpdatePlayer
        jmp gameLoop2
       
       yesFruit2:
        inc score
        inc score
        inc score
        inc score
        inc score
        mov pacMaiz2[esi], " "
        call UpdatePlayer
        jmp gameLoop2
       

        pauseGame2:

        call clrscr
        mov eax, yellow
        call SetTextColor
        mov dl, 0
        mov dh, 10
        call gotoxy
        mov edx, offset pauseScreen
        call Writestring
         call ReadChar
        mov inputChar,al
        cmp al, "c"
        je contAfterPause2



    exitGame2:

    mov esi , offset strDeNam 
add esi , midSz 

mov bl , 0ah 
mov [esi] , bl 
add esi , 1 
inc midSz 


mov edi, 0
mov ecx,30
mov ecx, sizeName

handLoop2 : 
mov bl , max[edi]
mov [esi] , bl 

inc esi 
inc edi 
inc midSz 

loop handLoop2
mov bl," "
mov [esi],bl
inc esi
inc midSz 
mov [esi],bl
inc esi
inc midSz 
mov eax, score
mov bl,100
div bl
OR al,30h
mov [esi],al
inc esi
inc midSz 
movzx eax,ah
mov bl,10
div bl
OR al,30h
mov [esi],al
inc esi
inc midSz 
OR ah,30h
mov [esi],ah
inc esi
inc midSz 

mov bl," "
mov [esi],bl
inc esi
inc midSz
mov eax, levelONETWOTHREE
mov bl,100
div bl
OR al,30h
inc ax
inc ax
mov [esi],al
inc esi
inc midSz

mov  edx, OFFSET namFl
call CreateOutputFile
mov  handFl, EAX


mov  eax, handFl
mov  edx, OFFSET strDeNam
mov  ecx, midSz
call WriteToFile


mov  eax, handFl
call CloseFile



    call clrscr
    mov eax, red
    call SetTextColor
    mov dl, 0
    mov dh, 2
    call gotoxy
    mov edx, offset gamOver
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 57
    mov dh, 9
    call gotoxy
    mov edx, offset newNam
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 60
    mov dh, 10
    call gotoxy
    mov edx, offset max
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 55
    mov dh, 11
    call gotoxy
    mov edx, offset newScore
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 60
    mov dh, 12
    call gotoxy
    mov eax, 0
    mov eax, score
    call WriteInt

        exit
    
    level3:

     contAfterPause3:
        call clrscr
        mov eax, yellow
        call SetTextColor



mov dl, xStartPos
mov dh, yStartPos
mov bl, dl
add bl, bLength  
sub bl, 1

mov esi, offset PacMaiz3
MaizePrint3:

call gotoxy
mov al, byte ptr [esi]
cmp al, 0
je continueGame3
call WriteChar
cmp dl, bl
jne dontskipnextline3
inc dh
mov dl, xStartPos
inc esi
jmp MaizePrint3
dontskipnextline3:
inc esi
inc dl
jmp MaizePrint3

continueGame3:

  inc levelONETWOTHREE

     gameLoop3:

     ; draw score:

        mov dl,90
        mov dh,4
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov dl,95
        mov dh,5
        call Gotoxy
        mov eax, 0
        mov eax,score
        call WriteInt
        

        ; draw lives:
         mov dl,94
        mov dh,8
        call Gotoxy
        mov edx,OFFSET strLives
        call WriteString
        mov dl,95
        mov dh,9
        call Gotoxy
        mov eax, 0
        mov eax, lives
        call WriteInt

          ; draw level:
        mov dl,93
        mov dh,12
        call Gotoxy
        mov edx,OFFSET strLevel1
        call Writestring
         mov dl,96
        mov dh,13
        call Gotoxy
        mov eax, 0
        mov eax, levelONETWOTHREE
        call WriteInt
        

         call UpdateGhost3
         call UpdateGhost4
         call UpdateGhost5

        ; get user key input:
        mov eax, 10
        call delay
        call ReadKey
        jz gameLoop3
        mov inputChar,al

        cmp al, "p"
        je pauseGame3
        

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame3

        cmp inputChar,"w"
        je moveUp3

        cmp inputChar,"s"
        je moveDown3

        cmp inputChar,"a"
        je moveLeft3

        cmp inputChar,"d"
        je moveRight3
        

        moveUp3:
            mov eax,0
            dec yPos
            movzx ax,yPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, Xpos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaiz3[esi], '#'
            je yesWall3
            
              cmp pacMaiz3[esi], "."
             je yesEat3

             cmp pacMaiz3[esi], "%"
             je yesFruit3

          cmp xPos, 84
          je xTele
          jne noTele


          xTele:
          cmp yPos, 14
          je teleYes

          teleYes:
          mov dl, 5
          mov dh, 14
          mov xPos, dl
          mov yPos, dh
          jmp noTele

           cmp xPos, 3
          je xTele11
          jne noTele


          xTele11:
          cmp yPos, 14
          je teleYes11

          teleYes11:
          mov dl, 84
          mov dh, 16
          mov xPos, dl
          mov yPos, dh
          
          noTele:
          
            call UpdatePlayer

        jmp gameLoop3

        moveDown3:
            mov eax,0
            inc yPos
            movzx ax,yPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx,xPos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaiz3[esi], "#"
            je yesWall3
          

              cmp pacMaiz3[esi], "."
             je yesEat3

             cmp pacMaiz3[esi], "%"
             je yesFruit3

              cmp xPos, 84
          je xTele2
          jne noTele2


          xTele2:
          cmp yPos, 14
          je teleYes2

          teleYes2:
          mov dl, 5
          mov dh, 14
          mov xPos, dl
          mov yPos, dh
           jmp noTele2
          
             cmp xPos, 3
          je xTele22
          jne noTele2


          xTele22:
          cmp yPos, 14
          je teleYes22

          teleYes22:
          mov dl, 84
          mov dh, 16
          mov xPos, dl
          mov yPos, dh
          

          noTele2:
     
            call UpdatePlayer

        jmp gameLoop3

        moveLeft3:
       mov eax,0
            mov eax,0
            dec xPos
            movzx ax,yPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx,Xpos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx
            movzx esi, ax
            cmp pacMaiz3[esi], "#"
            je yesWall3

             cmp pacMaiz3[esi], "."
             je yesEat3

             cmp pacMaiz3[esi], "%"
             je yesFruit3
            
          cmp xPos, 3
          je xTele3
          jne noTele3

          xTele3:
          cmp yPos, 14
          je teleYes3

          teleYes3:
          mov dl, 84
          mov dh, 14
          mov xPos, dl
          mov yPos, dh
       
          noTele3:

            call UpdatePlayer

        jmp gameLoop3

        moveRight3:
            mov eax,0
            inc xPos
            movzx ax,yPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx,xPos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx
            movzx esi, ax
            cmp pacMaiz3[esi], "#"
            je yesWall3

             cmp pacMaiz3[esi], "."
             je yesEat3

             cmp pacMaiz3[esi], "%"
             je yesFruit3

              cmp xPos, 84
          je xTele4
          jne noTele4


          xTele4:
          cmp yPos, 14
          je teleYes4
          jne noTele4

          teleYes4:
          mov dl, 5
          mov dh, 14
          mov xPos, dl
          mov yPos, dh
          
          noTele4:


            call UpdatePlayer

        jmp gameLoop3


        yesWall3:
        mov cl, tempX
        mov ch, tempY
        mov xPos, cl
        mov yPos, ch
        

        jmp gameLoop3


        yesEat3:
        inc score
        cmp score, 1704
        je exitGame3
        mov pacMaiz3[esi], " "
        call UpdatePlayer
        jmp gameLoop3
       
       yesFruit3:
        add score, 5
        mov pacMaiz3[esi], " "
        call UpdatePlayer
        jmp gameLoop3
       

        pauseGame3:

        call clrscr
        mov eax, yellow
        call SetTextColor
        mov dl, 0
        mov dh, 10
        call gotoxy
        mov edx, offset pauseScreen
        call Writestring
         call ReadChar
        mov inputChar,al
        cmp al, "c"
        je contAfterPause3



    exitGame3:

    mov esi , offset strDeNam 
add esi , midSz 

mov bl , 0ah 
mov [esi] , bl 
add esi , 1 
inc midSz 


mov edi, 0
mov ecx,30
mov ecx, sizeName

handLoop3 : 
mov bl , max[edi]
mov [esi] , bl 

inc esi 
inc edi 
inc midSz 

loop handLoop3
mov bl," "
mov [esi],bl
inc esi
inc midSz 
mov [esi],bl
inc esi
inc midSz 
mov eax, score
mov bl,100
div bl
OR al,30h
mov [esi],al
inc esi
inc midSz 
movzx eax,ah
mov bl,10
div bl
OR al,30h
mov [esi],al
inc esi
inc midSz 
OR ah,30h
mov [esi],ah
inc esi
inc midSz 

mov bl," "
mov [esi],bl
inc esi
inc midSz
mov eax, levelONETWOTHREE
mov bl,100
div bl
OR al,30h
inc ax
inc ax 
inc ax
mov [esi],al
inc esi
inc midSz

mov  edx, OFFSET namFl
call CreateOutputFile
mov  handFl, EAX


mov  eax, handFl
mov  edx, OFFSET strDeNam
mov  ecx, midSz
call WriteToFile


mov  eax, handFl
call CloseFile



    call clrscr
  mov eax, magenta
    call SetTextColor
    mov dl, 0
    mov dh, 2
    call gotoxy
    mov edx, offset gamOver
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 57
    mov dh, 9
    call gotoxy
    mov edx, offset newNam
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 60
    mov dh, 10
    call gotoxy
    mov edx, offset max
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 55
    mov dh, 11
    call gotoxy
    mov edx, offset newScore
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 60
    mov dh, 12
    call gotoxy
    mov eax, 0
    mov eax, score
    call WriteInt

    exit



main ENDP

DrawPlayer PROC
    ; draw player at (xPos,yPos):
    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al,"X"
    call WriteChar
    ret
DrawPlayer ENDP

DrawGhost PROC
  ;   draw Ghost at (xPos,yPos):
   mov eax,white ;(blue*16)
    call SetTextColor
    mov dl,xGPos
   mov dh,yGPos
    call Gotoxy
    mov al,"G"
    call WriteChar
    ret
DrawGhost ENDP


UpdatePlayer PROC
    mov dl,tempX
    mov dh,tempY
    call Gotoxy
    mov al," "
    call WriteChar
    mov dl, xPos
    mov dh, yPos
    call Gotoxy
      mov eax,yellow 
    call SetTextColor
    mov al,"X"
    call WriteChar
    mov dl, xPos
    mov dh, yPos
    mov tempX,dl
    mov tempY,dh
    call GhostCol
    ret
UpdatePlayer ENDP

UpdateGhost PROC



            movzx ax, GtempY
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, GtempX
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi,ax
            cmp pacMaize[esi], '.'
            je yesDot
            
            cmp pacMaize[esi]," "
            je yesSpace
           

            yesDot:
            mov dl,GtempX
            mov dh,GtempY
            call Gotoxy
            mov al,"."
            call WriteChar
            jmp afterSpace

            yesSpace:
             mov dl,GtempX
            mov dh,GtempY
            call Gotoxy
            mov al," "
            call WriteChar
           
           afterSpace:
    mov dl, xGPos
    mov dh, yGPos

     mov eax,0
     cmp isGleft, 1
     jne rightG
     


        leftG:
            dec xGPos
            movzx ax,yGPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, xGpos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaize[esi], '#' 
            jne busKar
            mov isGleft, 0

            rightG:
            inc xGPos
            movzx ax,yGPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, xGpos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaize[esi], '#'
            jne busKar
            mov isGleft, 1
            jmp leftG
           
 busKar:   
    mov dl, xGPos
    mov dh, yGPos
    call gotoxy
    mov eax, white
    call settextcolor
    mov al, "G"
    call Writechar

    mov GtempX,dl
    mov GtempY,dh
    
    call GhostCol
    ret
UpdateGhost ENDP


UpdateGhost2 PROC

            movzx ax, GtempY
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, GtempX
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi,ax
            cmp pacMaiz2[esi], '.'
            je yesDot2
            
            cmp pacMaiz2[esi]," "
            je yesSpace2
           

            yesDot2:
            mov dl,GtempX
            mov dh,GtempY
            call Gotoxy
            mov al,"."
            call WriteChar
            jmp afterSpace2

            yesSpace2:
             mov dl,GtempX
            mov dh,GtempY
            call Gotoxy
            mov al," "
            call WriteChar
           
           afterSpace2:
    mov dl, xGPos
    mov dh, yGPos

     mov eax,0
     cmp isGleft2, 1
     jne rightG2
     

        leftG2:
            dec xGPos
            movzx ax,yGPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, xGpos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaiz2[esi], '#' 
            jne busKar2
            mov isGleft2, 0

            rightG2:
            inc xGPos
            movzx ax,yGPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, xGpos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaiz2[esi], '#'
            jne busKar2
            mov isGleft2, 1
            jmp leftG2
           
 busKar2:   
    mov dl, xGPos
    mov dh, yGPos
    call gotoxy
    mov eax, white
    call settextcolor
    mov al, "G"
    call Writechar

    mov GtempX,dl
    mov GtempY,dh
    
    call GhostCol
    ret
UpdateGhost2 ENDP


UpdateGhost3 PROC

            movzx ax, GtempY
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, GtempX
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi,ax
            cmp pacMaiz3[esi], '.'
            je yesDot3
            
            cmp pacMaiz3[esi]," "
            je yesSpace3
           

            yesDot3:
            mov dl,GtempX
            mov dh,GtempY
            call Gotoxy
            mov al,"."
            call WriteChar
            jmp afterSpace3

            yesSpace3:
             mov dl,GtempX
            mov dh,GtempY
            call Gotoxy
            mov al," "
            call WriteChar
           
           afterSpace3:
    mov dl, xGPos
    mov dh, yGPos

     mov eax,0
     cmp isGleft3, 1
     jne rightG3
     


        leftG3:
            dec xGPos
            movzx ax,yGPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, xGpos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaiz3[esi], '#' 
            jne busKar3
            mov isGleft3, 0

            rightG3:
            inc xGPos
            movzx ax,yGPos
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, xGpos
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaiz3[esi], '#'
            jne busKar3
            mov isGleft3, 1
            jmp leftG3
           
 busKar3:   
    mov dl, xGPos
    mov dh, yGPos
    call gotoxy
    mov eax, white
    call settextcolor
    mov al, "G"
    call Writechar

    mov GtempX,dl
    mov GtempY,dh
    
    call GhostCol
    ret
UpdateGhost3 ENDP


UpdateGhost4 PROC

            movzx ax, GtempY2
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, GtempX2
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi,ax
            cmp pacMaiz3[esi], '.'
            je yesDot4
            
            cmp pacMaiz3[esi]," "
            je yesSpace4
           

            yesDot4:
            mov dl,GtempX2
            mov dh,GtempY2
            call Gotoxy
            mov al,"."
            call WriteChar
            jmp afterSpace4

            yesSpace4:
             mov dl,GtempX2
            mov dh,GtempY2
            call Gotoxy
            mov al," "
            call WriteChar
           
           afterSpace4:
    mov dl, xGPos2
    mov dh, yGPos2

     mov eax,0
     cmp isGleft33, 1
     jne rightG4
     


        leftG4:
            dec xGPos2
            movzx ax,yGPos2
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, xGpos2
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaiz3[esi], '#' 
            jne busKar4
            mov isGleft33, 0

            rightG4:
            inc xGPos2
            movzx ax,yGPos2
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, xGpos2
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaiz3[esi], '#'
            jne busKar4
            mov isGleft33, 1
            jmp leftG4
           
 busKar4:   
    mov dl, xGPos2
    mov dh, yGPos2
    call gotoxy
    mov eax, white
    call settextcolor
    mov al, "G"
    call Writechar

    mov GtempX2,dl
    mov GtempY2,dh
    
    call GhostCol2
    ret
UpdateGhost4 ENDP

UpdateGhost5 PROC

            movzx ax, GtempY3
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, GtempX3
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi,ax
            cmp pacMaiz3[esi], '.'
            je yesDot5
            
            cmp pacMaiz3[esi]," "
            je yesSpace5
           

            yesDot5:
            mov dl,GtempX3
            mov dh,GtempY3
            call Gotoxy
            mov al,"."
            call WriteChar
            jmp afterSpace5

            yesSpace5:
             mov dl,GtempX3
            mov dh,GtempY3
            call Gotoxy
            mov al," "
            call WriteChar
           
           afterSpace5:
    mov dl, xGPos3
    mov dh, yGPos3

     mov eax,0
     cmp isGleft333, 1
     jne rightG5
     


        leftG5:
            inc yGPos3
            movzx ax,yGPos3
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, xGpos3
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaiz3[esi], '#' 
            jne busKar5
            mov isGleft333, 0

            rightG5:
            dec yGPos3
            movzx ax,yGPos3
            movzx bx, yStartPos
            sub ax,bx
            mov bl, blength
            mul bl
            movzx bx, xGpos3
            movzx cx, xStartPos
            sub bx,cx
            add ax,bx

            movzx esi, ax
            cmp pacMaiz3[esi], '#'
            jne busKar5
            mov isGleft333, 1
            jmp leftG5
           
 busKar5:   
    mov dl, xGPos3
    mov dh, yGPos3
    call gotoxy
    mov eax, white
    call settextcolor
    mov al, "G"
    call Writechar

    mov GtempX3,dl
    mov GtempY3,dh
    
    call GhostCol3
    ret
UpdateGhost5 ENDP

GhostCol PROC
            mov cl, xPos
            mov ch, yPos
            cmp cl, xGpos
            je sameCo
            jne dafa

            sameCo:
            cmp ch, yGpos
            je livChange
            jne dafa

            livChange:
            dec lives
            cmp lives, 0
            je exitGame
            mov xPos, 83
            mov yPos, 5
            mov tempX, 83
            mov tempY, 5
            mov dl, 83
            mov dh, 5
            call gotoxy
            mov al, "X"
            call WriteChar

            dafa:
            jmp dude

             exitGame:
 mov esi , offset strDeNam 
add esi , midSz 

mov bl , 0ah 
mov [esi] , bl 
add esi , 1 
inc midSz 


mov edi, 0
mov ecx,30
mov ecx, sizeName

handLoop : 
mov bl , max[edi]
mov [esi] , bl 

inc esi 
inc edi 
inc midSz 

loop handLoop
mov bl," "
mov [esi],bl
inc esi
inc midSz 
mov [esi],bl
inc esi
inc midSz 
mov eax, score
mov bl,100
div bl
OR al,30h
mov [esi],al
inc esi
inc midSz 
movzx eax,ah
mov bl,10
div bl
OR al,30h
mov [esi],al
inc esi
inc midSz 
OR ah,30h
mov [esi],ah
inc esi
inc midSz 

mov bl," "
mov [esi],bl
inc esi
inc midSz
mov eax, levelONETWOTHREE
mov bl,100
div bl
OR al,30h
inc ax
mov [esi],al
inc esi
inc midSz

mov  edx, OFFSET namFl
call CreateOutputFile
mov  handFl, EAX


mov  eax, handFl
mov  edx, OFFSET strDeNam
mov  ecx, midSz
call WriteToFile


mov  eax, handFl
call CloseFile



    call clrscr

    mov eax, red
    call SetTextColor
    mov dl, 0
    mov dh, 2
    call gotoxy
    mov edx, offset gamOver
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 57
    mov dh, 9
    call gotoxy
    mov edx, offset newNam
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 60
    mov dh, 10
    call gotoxy
    mov edx, offset max
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 55
    mov dh, 11
    call gotoxy
    mov edx, offset newScore
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 60
    mov dh, 12
    call gotoxy
    mov eax, 0
    mov eax, score
    call WriteInt

    exit

    dude:
ret

GhostCol endp

GhostCol2 PROC
            mov cl, xPos
            mov ch, yPos
            cmp cl, xGpos2
            je sameCo2
            jne dafa2

            sameCo2:
            cmp ch, yGpos2
            je livChange2
            jne dafa2

            livChange2:
            dec lives
            cmp lives, 0
            je exitGame
            mov xPos, 83
            mov yPos, 5
            mov tempX, 83
            mov tempY, 5
            mov dl, 83
            mov dh, 5
            call gotoxy
            mov al, "X"
            call WriteChar

            dafa2:
            jmp dude2

             exitGame:
  mov esi , offset strDeNam 
add esi , midSz 

mov bl , 0ah 
mov [esi] , bl 
add esi , 1 
inc midSz 


mov edi, 0
mov ecx,30
mov ecx, sizeName

handLoop : 
mov bl , max[edi]
mov [esi] , bl 

inc esi 
inc edi 
inc midSz 

loop handLoop
mov bl," "
mov [esi],bl
inc esi
inc midSz 
mov [esi],bl
inc esi
inc midSz 
mov eax, score
mov bl,100
div bl
OR al,30h
mov [esi],al
inc esi
inc midSz 
movzx eax,ah
mov bl,10
div bl
OR al,30h
mov [esi],al
inc esi
inc midSz 
OR ah,30h
mov [esi],ah
inc esi
inc midSz 

mov bl," "
mov [esi],bl
inc esi
inc midSz
mov eax, levelONETWOTHREE
mov bl,100
div bl
OR al,30h
inc ax
inc ax
inc ax
mov [esi],al
inc esi
inc midSz

mov  edx, OFFSET namFl
call CreateOutputFile
mov  handFl, EAX


mov  eax, handFl
mov  edx, OFFSET strDeNam
mov  ecx, midSz
call WriteToFile


mov  eax, handFl
call CloseFile



    call clrscr

    mov eax, red
    call SetTextColor
    mov dl, 0
    mov dh, 2
    call gotoxy
    mov edx, offset gamOver
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 57
    mov dh, 9
    call gotoxy
    mov edx, offset newNam
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 60
    mov dh, 10
    call gotoxy
    mov edx, offset max
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 55
    mov dh, 11
    call gotoxy
    mov edx, offset newScore
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 60
    mov dh, 12
    call gotoxy
    mov eax, 0
    mov eax, score
    call WriteInt

    exit

    dude2:
ret

GhostCol2 endp

GhostCol3 PROC
            mov cl, xPos
            mov ch, yPos
            cmp cl, xGpos3
            je sameCo3
            jne dafa3

            sameCo3:
            cmp ch, yGpos3
            je livChange3
            jne dafa3

            livChange3:
            dec lives
            cmp lives, 0
            je exitGame
            mov xPos, 83
            mov yPos, 5
            mov tempX, 83
            mov tempY, 5
            mov dl, 83
            mov dh, 5
            call gotoxy
            mov al, "X"
            call WriteChar

            dafa3:
            jmp dude3

             exitGame:
  mov esi , offset strDeNam 
add esi , midSz 

mov bl , 0ah 
mov [esi] , bl 
add esi , 1 
inc midSz 


mov edi, 0
mov ecx,30
mov ecx, sizeName

handLoop : 
mov bl , max[edi]
mov [esi] , bl 

inc esi 
inc edi 
inc midSz 

loop handLoop
mov bl," "
mov [esi],bl
inc esi
inc midSz 
mov [esi],bl
inc esi
inc midSz 
mov eax, score
mov bl,100
div bl
OR al,30h
mov [esi],al
inc esi
inc midSz 
movzx eax,ah
mov bl,10
div bl
OR al,30h
mov [esi],al
inc esi
inc midSz 
OR ah,30h
mov [esi],ah
inc esi
inc midSz 

mov bl," "
mov [esi],bl
inc esi
inc midSz
mov eax, levelONETWOTHREE
mov bl,100
div bl
OR al,30h
inc ax
inc ax
inc ax
mov [esi],al
inc esi
inc midSz

mov  edx, OFFSET namFl
call CreateOutputFile
mov  handFl, EAX


mov  eax, handFl
mov  edx, OFFSET strDeNam
mov  ecx, midSz
call WriteToFile


mov  eax, handFl
call CloseFile



    call clrscr

    mov eax, red
    call SetTextColor
    mov dl, 0
    mov dh, 2
    call gotoxy
    mov edx, offset gamOver
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 57
    mov dh, 9
    call gotoxy
    mov edx, offset newNam
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 60
    mov dh, 10
    call gotoxy
    mov edx, offset max
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 55
    mov dh, 11
    call gotoxy
    mov edx, offset newScore
    call Writestring

    mov eax, yellow
    call SetTextColor
    mov dl, 60
    mov dh, 12
    call gotoxy
    mov eax, 0
    mov eax, score
    call WriteInt

    exit

    dude3:
ret

GhostCol3 endp


END main