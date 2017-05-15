module Paths_haskelm (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\cherr\\Desktop\\Projects_Exercises\\FP\\haskelm\\.stack-work\\install\\72e7e322\\bin"
libdir     = "C:\\Users\\cherr\\Desktop\\Projects_Exercises\\FP\\haskelm\\.stack-work\\install\\72e7e322\\lib\\x86_64-windows-ghc-7.10.3\\haskelm-0.1.0.0-6M6Ila8TMUR8eqgubdXocI"
datadir    = "C:\\Users\\cherr\\Desktop\\Projects_Exercises\\FP\\haskelm\\.stack-work\\install\\72e7e322\\share\\x86_64-windows-ghc-7.10.3\\haskelm-0.1.0.0"
libexecdir = "C:\\Users\\cherr\\Desktop\\Projects_Exercises\\FP\\haskelm\\.stack-work\\install\\72e7e322\\libexec"
sysconfdir = "C:\\Users\\cherr\\Desktop\\Projects_Exercises\\FP\\haskelm\\.stack-work\\install\\72e7e322\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskelm_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskelm_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "haskelm_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskelm_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskelm_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
