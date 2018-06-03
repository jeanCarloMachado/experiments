import Graphics.UI.GLUT
import Data.IORef
import Control.Monad

main :: IO ()
main = do
  (_progName, _args) <- getArgsAndInitialize
  initialDisplayMode $= [DoubleBuffered]
  _window <- createWindow "Hello World"
  reshapeCallback $= Just reshape
  keyboardMouseCallback $= Just keyboardMouse
  angle <- newIORef 0.0
  displayCallback $= display angle
  idleCallback $= Just (idle angle)
  mainLoop

reshape :: ReshapeCallback
reshape size = do
  viewport $= (Position 0 0, size)

keyboardMouse :: KeyboardMouseCallback
keyboardMouse _key _state _modifiers _position = return ()


display :: IORef GLfloat -> DisplayCallback
display angle = do
  clear [ColorBuffer]
  loadIdentity
  a <- get angle
  rotate a $ Vector3 0 0 1
  scale 0.7 0.7 (0.7::GLfloat)
  forM_ (points 7) $ \(x,y,z) ->
    preservingMatrix $ do
      color $ Color3 ((x+1)/2) ((y+1)/2) ((z+1)/2)
      translate $ Vector3 x y z
      cube 0.1
  swapBuffers


idle :: IORef GLfloat -> IdleCallback
idle angle = do
  angle $~! (+ 0.1)
  postRedisplay Nothing


points :: Int -> [ (GLfloat, GLfloat, GLfloat)]
points n = [ (sin (2*pi*k/n'), cos (2*pi*k/n'), 0 )  | k <- [1..n']]
  where n' = fromIntegral n

vertex3f :: (GLfloat, GLfloat, GLfloat) -> IO ()
vertex3f (x,y,z) = vertex $ Vertex3 x y z

cube :: GLfloat -> IO ()
cube w = renderPrimitive Quads $  mapM_ vertex3f
  [ ( w, w, w), ( w, w,-w), ( w,-w,-w), ( w,-w, w),
    ( w, w, w), ( w, w,-w), (-w, w,-w), (-w, w, w),
    ( w, w, w), ( w,-w, w), (-w,-w, w), (-w, w, w),
    (-w, w, w), (-w, w,-w), (-w,-w,-w), (-w,-w, w),
    ( w,-w, w), ( w,-w,-w), (-w,-w,-w), (-w,-w, w),
    ( w, w,-w), ( w,-w,-w), (-w,-w,-w), (-w, w,-w) ]


