<?

require_once("./db.inc");

$list_id = $_POST['list_id'];
$list_id = 1;

try{

    //一覧データ取得+詳細
	$sql = 'SELECT list_id,title, catch_text, key_id, prefecture, address, address_desc,description,note FROM LIST WHERE list_id=?';
	$stmt = $dbh->prepare($sql);
	$data[] = $list_id;
	$stmt->execute($data);



	$rec = $stmt->fetch(PDO::FETCH_ASSOC);

    $detail_array = array();
	$detail_array = $rec['name'];
	$detail_array['list_id'] = $rec['list_id'];
	$detail_array['title'] = $rec['title'];
	$detail_array['key_id'] = $rec['key_id'];
	$detail_array['prefecture'] = $rec['prefecture'];
	$detail_array['address'] = $rec['address'];
	$detail_array['address_desc'] = $rec['address_desc'];
	$detail_array['description'] = $rec['description'];
	$detail_array['note'] = $rec['note'];

	$dbh = null; //DB切断

}catch(Exception $e){
	echo 'エラー';
	exit();
}




//詳細データ
print_r($detail_array);

echo "test";

?>