-- Schema:
--
-- Likes(drinker, beer)
-- Frequents(drinker, bar)
-- Serves(bar, beer)
--
-- *part 1 find all drinkers that frequent some bar that serves some beer that they like
--
with serving as (Select s.beer as beer, S.bar
  From Serves as s)
Select distinct F.drinker
From Likes as L, Frequents as F, Serves as S
Where F.bar = S.bar
 And F.drinker = L.drinker
 And L.beer in (Select serving.beer
  From serving
  where serving.bar = s.bar);
-- * find all drinkers that frequent only bars that serve some beer that they like
--
-- * find all drinkers that frequent some bar that serves only beer that they like
--
-- * find all drinkers that frequent some bar that serves some beer that they don't like
--
-- * find all drinkers that frequent some bar that serves only beer that they don't like
--
-- * find all drinkers that frequent only bars that serve some beer that they don't like
--
-- * find all drinkers that frequent only bars that serve only beer that they don't like
