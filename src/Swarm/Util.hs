module Swarm.Util where

import           Data.Bifunctor  (first)
import qualified Data.Map        as M
import           Data.Text       (Text)

import           Swarm.AST
import           Swarm.Elaborate
import           Swarm.Parse
import           Swarm.Pretty
import           Swarm.Typecheck
import           Swarm.Types

processCmd :: Text -> Either Text ATerm
processCmd txt = do
  t <- readTerm txt
  at <- first prettyText (check M.empty t (TyCmd TyUnit))
  return $ elaborate (TyCmd TyUnit) at
