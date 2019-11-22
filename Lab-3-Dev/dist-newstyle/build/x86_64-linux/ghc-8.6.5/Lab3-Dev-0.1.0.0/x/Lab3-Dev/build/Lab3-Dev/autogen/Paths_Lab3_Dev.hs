{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_Lab3_Dev (
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

bindir     = "/home/jack/.cabal/bin"
libdir     = "/home/jack/.cabal/lib/x86_64-linux-ghc-8.6.5/Lab3-Dev-0.1.0.0-inplace-Lab3-Dev"
dynlibdir  = "/home/jack/.cabal/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/jack/.cabal/share/x86_64-linux-ghc-8.6.5/Lab3-Dev-0.1.0.0"
libexecdir = "/home/jack/.cabal/libexec/x86_64-linux-ghc-8.6.5/Lab3-Dev-0.1.0.0"
sysconfdir = "/home/jack/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Lab3_Dev_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Lab3_Dev_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Lab3_Dev_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Lab3_Dev_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Lab3_Dev_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Lab3_Dev_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
