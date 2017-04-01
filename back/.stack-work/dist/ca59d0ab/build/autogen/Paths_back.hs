{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_back (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\git\\yafebe\\back\\.stack-work\\install\\1841c92a\\bin"
libdir     = "C:\\git\\yafebe\\back\\.stack-work\\install\\1841c92a\\lib\\x86_64-windows-ghc-8.0.2\\back-0.1.0.0-7YKhG83L72VA823YDHbFJ0"
dynlibdir  = "C:\\git\\yafebe\\back\\.stack-work\\install\\1841c92a\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\git\\yafebe\\back\\.stack-work\\install\\1841c92a\\share\\x86_64-windows-ghc-8.0.2\\back-0.1.0.0"
libexecdir = "C:\\git\\yafebe\\back\\.stack-work\\install\\1841c92a\\libexec"
sysconfdir = "C:\\git\\yafebe\\back\\.stack-work\\install\\1841c92a\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "back_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "back_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "back_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "back_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "back_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "back_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
