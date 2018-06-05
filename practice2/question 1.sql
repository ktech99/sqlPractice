-- Schema:
--
-- Likes(drinker, beer)
-- Frequents(drinker, bar)
-- Serves(bar, beer)
--
-- AGGREGATE QUERIES
--
-- Part 1 for each bar, count the number of drinkers that frequent it, and that like both 'heineken' and 'bud'
--

Select F.bar, count(drinker)
From Frequents as F, Likes as L, Likes as L2
where L.drinker = F.drinker
  And L2.drinker = F.drinker
  And L.beer = 'heineken'
  And L2.beer = 'bud'
Group by F.bar;
-- * for each bar that serve both 'heineken' and 'bud' count the number of drinkers that frequent that bar
--
-- * for each bar that serve 'heineken' count the number of drinkers that frequent that bar and that like 'bud'
