`define upImgScr \
 case ( arrowH ) \
4'h0:    \
	begin \
	imgScr[7:0] <= imgScr[1927:1920];\
	imgScr[135:128] <= imgScr[7:0];\
	imgScr[263:256] <= imgScr[135:128];\
	imgScr[391:384] <= imgScr[263:256];\
	imgScr[519:512] <= imgScr[391:384];\
	imgScr[647:640] <= imgScr[519:512];\
	imgScr[775:768] <= imgScr[647:640];\
	imgScr[903:896] <= imgScr[775:768];\
	imgScr[1031:1024] <= imgScr[903:896];\
	imgScr[1159:1152] <= imgScr[1031:1024];\
	imgScr[1287:1280] <= imgScr[1159:1152];\
	imgScr[1415:1408] <= imgScr[1287:1280];\
	imgScr[1543:1536] <= imgScr[1415:1408];\
	imgScr[1671:1664] <= imgScr[1543:1536];\
	imgScr[1799:1792] <= imgScr[1671:1664];\
	imgScr[1927:1920] <= imgScr[1799:1792];\
	end \
4'h1:    \
	begin \
	imgScr[15:8] <= imgScr[1935:1928];\
	imgScr[143:136] <= imgScr[15:8];\
	imgScr[271:264] <= imgScr[143:136];\
	imgScr[399:392] <= imgScr[271:264];\
	imgScr[527:520] <= imgScr[399:392];\
	imgScr[655:648] <= imgScr[527:520];\
	imgScr[783:776] <= imgScr[655:648];\
	imgScr[911:904] <= imgScr[783:776];\
	imgScr[1039:1032] <= imgScr[911:904];\
	imgScr[1167:1160] <= imgScr[1039:1032];\
	imgScr[1295:1288] <= imgScr[1167:1160];\
	imgScr[1423:1416] <= imgScr[1295:1288];\
	imgScr[1551:1544] <= imgScr[1423:1416];\
	imgScr[1679:1672] <= imgScr[1551:1544];\
	imgScr[1807:1800] <= imgScr[1679:1672];\
	imgScr[1935:1928] <= imgScr[1807:1800];\
	end \
4'h2:    \
	begin \
	imgScr[23:16] <= imgScr[1943:1936];\
	imgScr[151:144] <= imgScr[23:16];\
	imgScr[279:272] <= imgScr[151:144];\
	imgScr[407:400] <= imgScr[279:272];\
	imgScr[535:528] <= imgScr[407:400];\
	imgScr[663:656] <= imgScr[535:528];\
	imgScr[791:784] <= imgScr[663:656];\
	imgScr[919:912] <= imgScr[791:784];\
	imgScr[1047:1040] <= imgScr[919:912];\
	imgScr[1175:1168] <= imgScr[1047:1040];\
	imgScr[1303:1296] <= imgScr[1175:1168];\
	imgScr[1431:1424] <= imgScr[1303:1296];\
	imgScr[1559:1552] <= imgScr[1431:1424];\
	imgScr[1687:1680] <= imgScr[1559:1552];\
	imgScr[1815:1808] <= imgScr[1687:1680];\
	imgScr[1943:1936] <= imgScr[1815:1808];\
	end \
4'h3:    \
	begin\
	imgScr[31:24] <= imgScr[1951:1944];\
	imgScr[159:152] <= imgScr[31:24];\
	imgScr[287:280] <= imgScr[159:152];\
	imgScr[415:408] <= imgScr[287:280];\
	imgScr[543:536] <= imgScr[415:408];\
	imgScr[671:664] <= imgScr[543:536];\
	imgScr[799:792] <= imgScr[671:664];\
	imgScr[927:920] <= imgScr[799:792];\
	imgScr[1055:1048] <= imgScr[927:920];\
	imgScr[1183:1176] <= imgScr[1055:1048];\
	imgScr[1311:1304] <= imgScr[1183:1176];\
	imgScr[1439:1432] <= imgScr[1311:1304];\
	imgScr[1567:1560] <= imgScr[1439:1432];\
	imgScr[1695:1688] <= imgScr[1567:1560];\
	imgScr[1823:1816] <= imgScr[1695:1688];\
	imgScr[1951:1944] <= imgScr[1823:1816];\
	end \
4'h4:    \
	begin \
	imgScr[39:32] <= imgScr[1959:1952];\
	imgScr[167:160] <= imgScr[39:32];\
	imgScr[295:288] <= imgScr[167:160];\
	imgScr[423:416] <= imgScr[295:288];\
	imgScr[551:544] <= imgScr[423:416];\
	imgScr[679:672] <= imgScr[551:544];\
	imgScr[807:800] <= imgScr[679:672];\
	imgScr[935:928] <= imgScr[807:800];\
	imgScr[1063:1056] <= imgScr[935:928];\
	imgScr[1191:1184] <= imgScr[1063:1056];\
	imgScr[1319:1312] <= imgScr[1191:1184];\
	imgScr[1447:1440] <= imgScr[1319:1312];\
	imgScr[1575:1568] <= imgScr[1447:1440];\
	imgScr[1703:1696] <= imgScr[1575:1568];\
	imgScr[1831:1824] <= imgScr[1703:1696];\
	imgScr[1959:1952] <= imgScr[1831:1824];\
	end \
4'h5:    \
	begin \
	imgScr[47:40] <= imgScr[1967:1960];\
	imgScr[175:168] <= imgScr[47:40];\
	imgScr[303:296] <= imgScr[175:168];\
	imgScr[431:424] <= imgScr[303:296];\
	imgScr[559:552] <= imgScr[431:424];\
	imgScr[687:680] <= imgScr[559:552];\
	imgScr[815:808] <= imgScr[687:680];\
	imgScr[943:936] <= imgScr[815:808];\
	imgScr[1071:1064] <= imgScr[943:936];\
	imgScr[1199:1192] <= imgScr[1071:1064];\
	imgScr[1327:1320] <= imgScr[1199:1192];\
	imgScr[1455:1448] <= imgScr[1327:1320];\
	imgScr[1583:1576] <= imgScr[1455:1448];\
	imgScr[1711:1704] <= imgScr[1583:1576];\
	imgScr[1839:1832] <= imgScr[1711:1704];\
	imgScr[1967:1960] <= imgScr[1839:1832];\
	end \
4'h6:    \
	begin \
	imgScr[55:48] <= imgScr[1975:1968];\
	imgScr[183:176] <= imgScr[55:48];\
	imgScr[311:304] <= imgScr[183:176];\
	imgScr[439:432] <= imgScr[311:304];\
	imgScr[567:560] <= imgScr[439:432];\
	imgScr[695:688] <= imgScr[567:560];\
	imgScr[823:816] <= imgScr[695:688];\
	imgScr[951:944] <= imgScr[823:816];\
	imgScr[1079:1072] <= imgScr[951:944];\
	imgScr[1207:1200] <= imgScr[1079:1072];\
	imgScr[1335:1328] <= imgScr[1207:1200];\
	imgScr[1463:1456] <= imgScr[1335:1328];\
	imgScr[1591:1584] <= imgScr[1463:1456];\
	imgScr[1719:1712] <= imgScr[1591:1584];\
	imgScr[1847:1840] <= imgScr[1719:1712];\
	imgScr[1975:1968] <= imgScr[1847:1840];\
	end \
4'h7:    \
	begin \
	imgScr[63:56] <= imgScr[1983:1976];\
	imgScr[191:184] <= imgScr[63:56];\
	imgScr[319:312] <= imgScr[191:184];\
	imgScr[447:440] <= imgScr[319:312];\
	imgScr[575:568] <= imgScr[447:440];\
	imgScr[703:696] <= imgScr[575:568];\
	imgScr[831:824] <= imgScr[703:696];\
	imgScr[959:952] <= imgScr[831:824];\
	imgScr[1087:1080] <= imgScr[959:952];\
	imgScr[1215:1208] <= imgScr[1087:1080];\
	imgScr[1343:1336] <= imgScr[1215:1208];\
	imgScr[1471:1464] <= imgScr[1343:1336];\
	imgScr[1599:1592] <= imgScr[1471:1464];\
	imgScr[1727:1720] <= imgScr[1599:1592];\
	imgScr[1855:1848] <= imgScr[1727:1720];\
	imgScr[1983:1976] <= imgScr[1855:1848];\
	end \
4'h8:    \
	begin \
	imgScr[71:64] <= imgScr[1991:1984];\
	imgScr[199:192] <= imgScr[71:64];\
	imgScr[327:320] <= imgScr[199:192];\
	imgScr[455:448] <= imgScr[327:320];\
	imgScr[583:576] <= imgScr[455:448];\
	imgScr[711:704] <= imgScr[583:576];\
	imgScr[839:832] <= imgScr[711:704];\
	imgScr[967:960] <= imgScr[839:832];\
	imgScr[1095:1088] <= imgScr[967:960];\
	imgScr[1223:1216] <= imgScr[1095:1088];\
	imgScr[1351:1344] <= imgScr[1223:1216];\
	imgScr[1479:1472] <= imgScr[1351:1344];\
	imgScr[1607:1600] <= imgScr[1479:1472];\
	imgScr[1735:1728] <= imgScr[1607:1600];\
	imgScr[1863:1856] <= imgScr[1735:1728];\
	imgScr[1991:1984] <= imgScr[1863:1856];\
	end \
4'h9:    \
	begin \
	imgScr[79:72] <= imgScr[1999:1992];\
	imgScr[207:200] <= imgScr[79:72];\
	imgScr[335:328] <= imgScr[207:200];\
	imgScr[463:456] <= imgScr[335:328];\
	imgScr[591:584] <= imgScr[463:456];\
	imgScr[719:712] <= imgScr[591:584];\
	imgScr[847:840] <= imgScr[719:712];\
	imgScr[975:968] <= imgScr[847:840];\
	imgScr[1103:1096] <= imgScr[975:968];\
	imgScr[1231:1224] <= imgScr[1103:1096];\
	imgScr[1359:1352] <= imgScr[1231:1224];\
	imgScr[1487:1480] <= imgScr[1359:1352];\
	imgScr[1615:1608] <= imgScr[1487:1480];\
	imgScr[1743:1736] <= imgScr[1615:1608];\
	imgScr[1871:1864] <= imgScr[1743:1736];\
	imgScr[1999:1992] <= imgScr[1871:1864];\
	end \
4'ha:    \
	begin \
	imgScr[87:80] <= imgScr[2007:2000];\
	imgScr[215:208] <= imgScr[87:80];\
	imgScr[343:336] <= imgScr[215:208];\
	imgScr[471:464] <= imgScr[343:336];\
	imgScr[599:592] <= imgScr[471:464];\
	imgScr[727:720] <= imgScr[599:592];\
	imgScr[855:848] <= imgScr[727:720];\
	imgScr[983:976] <= imgScr[855:848];\
	imgScr[1111:1104] <= imgScr[983:976];\
	imgScr[1239:1232] <= imgScr[1111:1104];\
	imgScr[1367:1360] <= imgScr[1239:1232];\
	imgScr[1495:1488] <= imgScr[1367:1360];\
	imgScr[1623:1616] <= imgScr[1495:1488];\
	imgScr[1751:1744] <= imgScr[1623:1616];\
	imgScr[1879:1872] <= imgScr[1751:1744];\
	imgScr[2007:2000] <= imgScr[1879:1872];\
	end \
4'hb:    \
	begin \
	imgScr[95:88] <= imgScr[2015:2008];\
	imgScr[223:216] <= imgScr[95:88];\
	imgScr[351:344] <= imgScr[223:216];\
	imgScr[479:472] <= imgScr[351:344];\
	imgScr[607:600] <= imgScr[479:472];\
	imgScr[735:728] <= imgScr[607:600];\
	imgScr[863:856] <= imgScr[735:728];\
	imgScr[991:984] <= imgScr[863:856];\
	imgScr[1119:1112] <= imgScr[991:984];\
	imgScr[1247:1240] <= imgScr[1119:1112];\
	imgScr[1375:1368] <= imgScr[1247:1240];\
	imgScr[1503:1496] <= imgScr[1375:1368];\
	imgScr[1631:1624] <= imgScr[1503:1496];\
	imgScr[1759:1752] <= imgScr[1631:1624];\
	imgScr[1887:1880] <= imgScr[1759:1752];\
	imgScr[2015:2008] <= imgScr[1887:1880];\
	end \
4'hc:    \
	begin \
	imgScr[103:96] <= imgScr[2023:2016];\
	imgScr[231:224] <= imgScr[103:96];\
	imgScr[359:352] <= imgScr[231:224];\
	imgScr[487:480] <= imgScr[359:352];\
	imgScr[615:608] <= imgScr[487:480];\
	imgScr[743:736] <= imgScr[615:608];\
	imgScr[871:864] <= imgScr[743:736];\
	imgScr[999:992] <= imgScr[871:864];\
	imgScr[1127:1120] <= imgScr[999:992];\
	imgScr[1255:1248] <= imgScr[1127:1120];\
	imgScr[1383:1376] <= imgScr[1255:1248];\
	imgScr[1511:1504] <= imgScr[1383:1376];\
	imgScr[1639:1632] <= imgScr[1511:1504];\
	imgScr[1767:1760] <= imgScr[1639:1632];\
	imgScr[1895:1888] <= imgScr[1767:1760];\
	imgScr[2023:2016] <= imgScr[1895:1888];\
	end \
4'hd:    \
	begin \
	imgScr[111:104] <= imgScr[2031:2024];\
	imgScr[239:232] <= imgScr[111:104];\
	imgScr[367:360] <= imgScr[239:232];\
	imgScr[495:488] <= imgScr[367:360];\
	imgScr[623:616] <= imgScr[495:488];\
	imgScr[751:744] <= imgScr[623:616];\
	imgScr[879:872] <= imgScr[751:744];\
	imgScr[1007:1000] <= imgScr[879:872];\
	imgScr[1135:1128] <= imgScr[1007:1000];\
	imgScr[1263:1256] <= imgScr[1135:1128];\
	imgScr[1391:1384] <= imgScr[1263:1256];\
	imgScr[1519:1512] <= imgScr[1391:1384];\
	imgScr[1647:1640] <= imgScr[1519:1512];\
	imgScr[1775:1768] <= imgScr[1647:1640];\
	imgScr[1903:1896] <= imgScr[1775:1768];\
	imgScr[2031:2024] <= imgScr[1903:1896];\
	end \
4'he:    \
	begin \
	imgScr[119:112] <= imgScr[2039:2032];\
	imgScr[247:240] <= imgScr[119:112];\
	imgScr[375:368] <= imgScr[247:240];\
	imgScr[503:496] <= imgScr[375:368];\
	imgScr[631:624] <= imgScr[503:496];\
	imgScr[759:752] <= imgScr[631:624];\
	imgScr[887:880] <= imgScr[759:752];\
	imgScr[1015:1008] <= imgScr[887:880];\
	imgScr[1143:1136] <= imgScr[1015:1008];\
	imgScr[1271:1264] <= imgScr[1143:1136];\
	imgScr[1399:1392] <= imgScr[1271:1264];\
	imgScr[1527:1520] <= imgScr[1399:1392];\
	imgScr[1655:1648] <= imgScr[1527:1520];\
	imgScr[1783:1776] <= imgScr[1655:1648];\
	imgScr[1911:1904] <= imgScr[1783:1776];\
	imgScr[2039:2032] <= imgScr[1911:1904];\
	end \
4'hf:    \
	begin \
	imgScr[127:120] <= imgScr[2047:2040];\
	imgScr[255:248] <= imgScr[127:120];\
	imgScr[383:376] <= imgScr[255:248];\
	imgScr[511:504] <= imgScr[383:376];\
	imgScr[639:632] <= imgScr[511:504];\
	imgScr[767:760] <= imgScr[639:632];\
	imgScr[895:888] <= imgScr[767:760];\
	imgScr[1023:1016] <= imgScr[895:888];\
	imgScr[1151:1144] <= imgScr[1023:1016];\
	imgScr[1279:1272] <= imgScr[1151:1144];\
	imgScr[1407:1400] <= imgScr[1279:1272];\
	imgScr[1535:1528] <= imgScr[1407:1400];\
	imgScr[1663:1656] <= imgScr[1535:1528];\
	imgScr[1791:1784] <= imgScr[1663:1656];\
	imgScr[1919:1912] <= imgScr[1791:1784];\
	imgScr[2047:2040] <= imgScr[1919:1912];\
	end \
endcase
