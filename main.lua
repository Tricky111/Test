display.setDefault( "background", 100/255, 200/255, 100/255 )

local physics = require( "physics" )


physics.start()


physics.setGravity( 0, 25 ) -- ( x, y )



PointText = 0


local audio1 = audio.loadSound( "QWERTY.mp3" )

audio.play(audio1)




local screenText = display.newText( "Ball Bounce Game", 250, 100, native.systemFont, 105)


local PointText = display.newText( "Your Score: " .. PointText, 1900, 100, native.systemFont, 105)



local theGround = display.newImageRect( "Wall.png", 100, 1570 )



theGround.x = - 250



theGround.y = 750



theGround.id = "the ground"



physics.addBody( theGround, "static", { 



    friction = 0.5, 



    bounce = 2



    } )




local theGround = display.newImageRect( "Wall.png", 100, 1570 )



theGround.x =  2300



theGround.y = 750



theGround.id = "the ground"



physics.addBody( theGround, "static", { 



    friction = 0.5, 



    bounce = 2



    } )


local theGround = display.newImageRect( "Wall.png", 5000000, 100 )



theGround.x =  900



theGround.y = 1



theGround.id = "the ground"



physics.addBody( theGround, "static", { 



    friction = 0.5, 



    bounce = 2



    } )





local Ball = display.newImageRect( "Ball.png", 250, 250 )



Ball.x = display.contentCenterX



Ball.y = 100



Ball.id = "Ball"



physics.addBody( Ball, "dynamic", { 



    density = 3.0, 



    friction = 0.5, 



    bounce = 210489325238959 -- Its Insane But It Works 



    } )



local PongPong = display.newImageRect( "TheGuy.png", 500, 100 )



PongPong.x = display.contentCenterX



PongPong.y = 1500



PongPong.id = "the character"



physics.addBody( PongPong, "static", { 



    density = 3.0, 



    friction = 0.5, 



    bounce = 5



    } )

PongPong.isFixedRotation = true


function checkCharacterPosition( event )






    if Ball.y > display.contentHeight + 500 then
print("Game Over")
screenText.text = "Game Over"



    end
end


local function PongPongtouch ( event )
    local PongPongtouched = event.target



        if (event.phase == "began") then
            display.getCurrentStage():setFocus( PongPongtouched )


            PongPongtouched.startMoveX = PongPongtouched.x



        elseif (event.phase == "moved") then
                 PongPongtouched.x = (event.x - event.xStart) + PongPongtouched.startMoveX
 

        elseif event.phase == "ended" or event.phase == "cancelled"  then
                display.getCurrentStage():setFocus( nil )
                PongPongtouched.x = PongPong.x
             
        end 
                return true
end



local function BallCollision( self, event )
 if ( event.phase == "began" ) then

        

        if event.id == "Ball" then
            PointText = PointText + 1
             PointText.text = ("Your Score: ".. PointText)
         end
           elseif ( event.phase == "ended" ) then
       end
   end



Runtime:addEventListener( "enterFrame", checkCharacterPosition )

Runtime:addEventListener( "collision", checkCharacterPosition )

PongPong:addEventListener("touch", PongPongtouch )

