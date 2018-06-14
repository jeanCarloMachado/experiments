import Graphics.UI.GLUT
import Control.Monad
import Data.IORef
import Data.Tuple.Select
import Data.List
import System.Posix.Unistd

red = (1, 0, 0)
yellow = (1, 1, 0)
originalTriangle = MyTriangle  (0, 1) (-1, -1) (1, -1) red

data MyTriangle = MyTriangle {
  -- single
  point1 :: (GLfloat, GLfloat),
  --left
  point2 :: (GLfloat, GLfloat),
  -- right
  point3 :: (GLfloat, GLfloat),
  tColor :: (GLfloat, GLfloat, GLfloat)
} deriving (Show)

main :: IO ()
main = do
  (_progName, _args) <- getArgsAndInitialize
  initialDisplayMode $= [DoubleBuffered]
  _window <- createWindow "Hello World"
  windowSize $= Size 900 700
  reshapeCallback $= Just reshape
  -- triangles <- newIORef [originalTriangle]
  triangles <- newIORef $ onetriangle2Tree originalTriangle
  displayCallback $= display triangles
  idleCallback $= Just (idle triangles)
  mainLoop

display :: IORef [MyTriangle] -> DisplayCallback
display triangles  = do
  clear [ColorBuffer]
  loadIdentity
  trigs <- get triangles
  renderPrimitive Triangles $ do
    mapM_ renderTrig trigs
  swapBuffers

renderTrig :: MyTriangle -> IO()
renderTrig trig = do
    colorize $ tColor trig
    vertex3f (fst $ point1 trig) (snd $ point1 trig) 0.0
    vertex3f (fst $ point2 trig) (snd $ point2 trig) 0.0
    vertex3f (fst $ point3 trig) (snd $ point3 trig) 0.0
    where
      vertex3f x y z = vertex $ Vertex3 x y (z :: GLfloat)

colorize (r,g,b) =
    color $ Color3 r g (b :: GLfloat)

idle :: IORef [MyTriangle] -> IdleCallback
idle trigs = do
  sleep 1
  utrigs <- get trigs
  trigs $=! utrigs
  trigs $=! foldl (\acc x -> acc ++ (onetriangle2Tree x)) [] utrigs
  postRedisplay Nothing


-- originalTriangle = MyTriangle  (0.5, 1) (0, 0) (1, 0) red
----   1
--
-- m12   m13
--
--2   m23    3

onetriangle2Tree :: MyTriangle -> [MyTriangle]
onetriangle2Tree trig =
  [
    MyTriangle (point1 trig) (mid12) (mid13) yellow,
    MyTriangle (mid12) (point2 trig) (mid23) yellow,
    MyTriangle (mid13) (mid23) (point3 trig) yellow
  ]
  where
    mid12 = middlePoint (point1 trig) (point2 trig)
    mid13 = middlePoint (point1 trig) (point3 trig)
    mid23 = middlePoint (point2 trig) (point3 trig)


middlePoint (x1, y1) (x2, y2) =
  (((x1 + x2) /2 ), ((y1 + y2) /2) )

reshape :: ReshapeCallback
reshape size = do
  viewport $= (Position 0 0, size)


