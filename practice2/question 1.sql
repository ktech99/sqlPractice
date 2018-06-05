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

Select F.bar, count(distinct F.drinker)
From Frequents as F, Likes as L, Likes as L2
where L.drinker = F.drinker
  And L2.drinker = F.drinker
  And L.beer = 'heineken'
  And L2.beer = 'bud'
Group by F.bar;
-- * for each bar that serve both 'heineken' and 'bud' count the number of drinkers that frequent that bar
--

Select F.bar, count(distinct F.drinker)
From Serves as s1, Serves as s2, Frequents as F
Where s1.bar = F.bar
  And s2.bar = F.bar
  And S1.beer = 'heineken'
  And S2.beer = 'bud';
Group by F.bar;
-- * for each bar that serve 'heineken' count the number of drinkers that frequent that bar and that like 'bud'

Select S.bar, count(distinct F.drinker)
From Likes as L, Frequents as F, Serves as S
Where L.beer = 'bud'
  And F.drinker = L.drinker
  And F.bar = S.bar
  And S.serve = 'heineken'
Group By s.bar;
