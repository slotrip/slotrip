<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>SLOTRIP TOPページ</title>
<link rel="stylesheet" type="text/css" href="style/style.css">
</head>
<body>
<div class="parent">
  <div class="inner">
    <div class="tablecell">
      <div class="photo1">
        <img src="images/ryokou.jpg" width="320px" height="200px" border="1px">
      </div>
      <div border="2">
        <div id="dram" class="center">
          <p>☆</p>
        </div>
          <tr>
            <button type="button" type = “submit” value="" onClick="dramstop(0,lists)">おす</button><!--引数でリストデータ渡しました-->
          </tr>
            <button type="button" value="" onClick="dramreset()">リセット</button>
          </div>
        </div>
      </div>
    </div>

    <div class="list">
      <!-- <p>スロットと一覧で各自マージン取ったりして、良い感じにしていただけますか…。</p> -->
      <div id="listdata"></div>
    </div>


<script language="JavaScript">
//keywords = new Array("とうきょう","ぐんま","栃木","いばらき","さいたま","かながわ");
keywords = <?=$key_json?>; //DBのデータ（キーワード）
console.log(keywords);

lists = <?=$list_json?>; //DBのデータ（リスト）
//console.log(lists);

num = 0;


dramreset();
dramstart();

/* 詳細画面から一覧に戻った時、スロットを止めて一覧を表示したいけどできない…
//kw = <?=$kw?>;
//console.log('kw);
if(kw !== ''){
  document.getElementById("dram").disabled = true;
  getListData(lists,kw);
}
*/

function dramstop(btn) {
	// r = Math.floor(Math.random() * 6); //データ5つなので下記に修正（削除して良い）
	r = Math.floor(Math.random() * 5);
	document.getElementById("dram").disabled = true;
	// btn_num++; //何のための変数でしょうか　未定義エラーになっているので、一旦コメントアウトしています

  //スロットを止めた時リスト表示
  getListData(lists,r+1);

}

function dramreset(){

  var s = "";
  for (i=0; i<1; i++) {
    if (num > 0) {
      // s += "<th>" + keywords[r] + "</th>";//配列の構造変わったので修正（削除して良い）
      s += "<th>" + keywords[r]['keyword'] + "</th>";
    }
    document.getElementById("dram").disabled = false;
  }


}

function dramstart() {

    if (!document.getElementById("dram").disabled) {

      document.getElementById("listdata").innerHTML = '';

      // r = Math.floor(Math.random() * 6);//データ5つなので下記に修正（削除して良い）
      r = Math.floor(Math.random() * 5);
      // document.getElementById("dram").innerHTML = keywords[r];/配列の構造変わったので修正（削除して良い）
      document.getElementById("dram").innerHTML = keywords[r]['keyword'];
    }
  setTimeout("dramstart()",200);

}

//リストデータ表示用関数
function getListData(lists,key_id){
  //ストップしたキーワードのリストデータ作成
  listhtml  = '';
  for (var key in lists){

//console.log(lists[key]['key_id']);
//console.log(r);

    if(lists[key]['key_id'] == key_id){

      //リストに表示したいタグはここの変数に追加していってください。タグはとりあえずdivにしているので変更していただけると…
      listhtml += '<div><a href="./detail.php?list_id=' + lists[key]['list_id'] + '">' + lists[key]['title'] + '</a></div>';
      listhtml += '<div>' + lists[key]['catch_text'] + '</div>';
      listhtml += '<div>' + lists[key]['prefecture'] + '</div>';
      listhtml += '<div>' + lists[key]['address_desc'] + '</div>';
      listhtml += '<br>';

    }

  }

  document.getElementById("listdata").innerHTML = listhtml;
}

</script>
</body>
</html>
