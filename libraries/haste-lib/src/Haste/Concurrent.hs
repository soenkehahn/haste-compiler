-- | Concurrency for Haste. Includes MVars, forking, Ajax and more.
module Haste.Concurrent (module Monad, module Ajax, wait) where
import Haste.Concurrent.Monad as Monad
import Haste.Concurrent.Ajax as Ajax
import Haste.Callback

-- | Wait for n milliseconds.
wait :: Int -> CIO ()
wait ms = do
  v <- newEmptyMVar
  liftIO $ setTimeout' ms $ putMVar v ()
  takeMVar v
