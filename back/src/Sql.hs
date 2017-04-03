module Sql where


import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow
import System.Directory

data TestField = TestField Int String deriving (Show)

instance FromRow TestField where
  fromRow = TestField <$> field <*> field

main2 :: IO ()
main2 = do
  getCurrentDirectory >>= print
  conn <- open "sqlite/test.db"
  execute conn "INSERT INTO test (str) VALUES (?)"
    (Only ("test string 2" :: String))
  r <- query_ conn "SELECT * from test" :: IO [TestField]
  mapM_ print r
  close conn