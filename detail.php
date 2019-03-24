<?

require_once("./db.inc");

$list_id = $_GET['list_id'];
//$list_id = 1;

try{

    //一覧データ取得(詳細用1件)
	$sql = 'SELECT list_id,title,catch_text,key_id,prefecture,address,latitude,longitude,address_desc,description,note FROM LIST WHERE list_id=?';
	$stmt = $dbh->prepare($sql);
	$data[] = $list_id;
	$stmt->execute($data);

	$rec = $stmt->fetch(PDO::FETCH_ASSOC);

	$list_id      = $rec['list_id'];
	$title        = $rec['title'];
	$catch_text   = $rec['catch_text'];
	$key_id       = $rec['key_id'];
	$prefecture   = $rec['prefecture'];
	$address      = $rec['address'];
	$latitude     = $rec['latitude'];
	$longitude    = $rec['longitude'];
	$address_desc = $rec['address_desc'];
	$description  = $rec['description'];
	$note         = $rec['note'];

	$dbh = null; //DB切断

}catch(Exception $e){
	echo 'エラー';
	exit();
}

//テンプレート
require_once("./detail.tpl")

?>