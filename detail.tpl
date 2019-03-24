<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>SLOTRIP 詳細ページ</title>
<link rel="stylesheet" type="text/css" href="style/style.css">
</head>
<body>

<div><?=$title?></div>
<div><?=$catch_text?></div>
<div><?=$prefecture?></div>
<div><?=$address?></div>
<div><?=$address_desc?></div>
<div><?=$description?></div>
<div><?=$note?></div>


<a href="./index.php?kw=<?=$key_id?>">戻る</a>
<a href="./index.php">リセット</a>

<div id="map" style="width:400px; height:300px"></div>

<script type="text/javascript" charset="utf-8" src="https://map.yahooapis.jp/js/V1/jsapi?appid=dj00aiZpPUFablhFeFc3ZDlxeiZzPWNvbnN1bWVyc2VjcmV0Jng9NDY-"></script>
<script type="text/javascript">

window.onload = function(){

    lat = <?=$latitude?>;
    long = <?=$longitude?>;

   var ymap = new Y.Map("map");
   ymap.drawMap(new Y.LatLng(lat, long), 17, Y.LayerSetId.NORMAL);

//   var marker = new Y.Marker(new Y.LatLng(35.64997652994234,139.72116702175174));
   var marker = new Y.Marker(new Y.LatLng(lat, long));
    ymap.addFeature(marker);
}
</script>

</body>
</html>
