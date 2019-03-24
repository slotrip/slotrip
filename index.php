<?

echo "aaa";

require_once("./db.inc");

$kw = '';
if(isset($_GET['kw'])){
    $kw = $_GET['kw'];
}
echo $kw;

try{

    //キーワードデータ取得
	$sql = 'SELECT key_id,keyword FROM KEYWORD WHERE 1 ORDER BY key_id'; //1は全てという意味
	$stmt = $dbh->prepare($sql);
	$stmt->execute();

    $key_array = array();
    // $num = 1;
	while(true){
		$rec = $stmt->fetch(PDO::FETCH_ASSOC);

		if($rec == false){
			break;
		}

        $tmp_arr['key_id'] = $rec['key_id'];
        $tmp_arr['keyword'] = $rec['keyword'];
        $key_array[] = $tmp_arr;
        //$key_array[$num] = $tmp_arr;
        // $num++;

	}



    //一覧データ取得
	$sql = 'SELECT list_id,title,catch_text,key_id, prefecture,address,address_desc FROM LIST WHERE 1 ORDER BY list_id';
	$stmt = $dbh->prepare($sql);
	$stmt->execute();

    $list_array = array();
    // $num = 1;
	while(true){
		$rec = $stmt->fetch(PDO::FETCH_ASSOC);

		if($rec == false){
			break;
		}

        $tmp_arr['list_id'] = $rec['list_id'];
        $tmp_arr['title'] = $rec['title'];
        $tmp_arr['catch_text'] = $rec['catch_text'];
        $tmp_arr['key_id'] = $rec['key_id'];
        $tmp_arr['prefecture'] = $rec['prefecture'];
        $tmp_arr['address'] = $rec['address'];
        $tmp_arr['address_desc'] = $rec['address_desc'];
        //$list_array[$num] = $tmp_arr;
        $list_array[] = $tmp_arr;
        // $num+;

	}

	$dbh = null; //DB切断


}catch(Exception $e){
	echo 'エラー';
	exit();
}



//キーワード配列
//print_r($key_array);

//js用の値
$key_json = json_encode($key_array);
//print_r($key_json);

//一覧配列
//print_r($list_array);
$list_json = json_encode($list_array);

//テンプレート
require_once("./index.tpl")

?>