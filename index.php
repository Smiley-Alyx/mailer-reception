<?php
var_dump('1');
require_once('Users.php');
require_once('Reception.php');
require_once('Time.php');
//require_once('mailer.php');
var_dump('2');
$users = new Users();
$reception = new Reception();
$time = new Time();
var_dump('3');
//$date = date("Y-m-d", strtotime("tomorrow"));
$date = "2018-11-14";
var_dump('4');
$data_reception = $reception->selectReceptionUser($date);
?>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<?php foreach ($data_reception as $key): ?>
    <?php 
        $userData = $users->selectUser($key['user_id']);
        if($userData['email']) {
            echo $userData['email'].' ';
            echo $time->selectTime($key['time_id']).'<br>';

            $sendto = $userData['email'];
            $receptionNumber = $key['id'];
            $receptionDate = $key['date'];
            $receptionTime = $time->selectTime($key['time_id']);
            $receptionOperator = $key['operator_id'];
            $receptionUser = $userData['last_name'].' '.$userData['first_name'].' '.$userData['middle_name'];
            $receptionUserPhone = $userData['phone'];
            
            // Формирование заголовка письма
            $subject  = "Новое сообщение";
            $headers  = "From: " . strip_tags($sendto) . "\r\n";
            $headers .= "Reply-To: ". strip_tags($sendto) . "\r\n";
            $headers .= "MIME-Version: 1.0\r\n";
            $headers .= "Content-Type: text/html;charset=utf-8 \r\n";
            
            // Формирование тела письма
            $msg  = "<html><body style='font-family:Arial,sans-serif;'>";
            $msg .= "<h2 style='font-weight:bold;border-bottom:1px dotted #ccc;'>Запись в дошкольный отдел Комитета по образованию</h2>\r\n";
            $msg .= "<p>Напоминаем, что завтра, ".$receptionDate." в ".$receptionTime." у Вас назначен приём в дошкольный отдел Комитета по образованию</p>\r\n";
            $msg .= "<p><strong>Номер записи: </strong> ".$receptionNumber."</p>\r\n";
            $msg .= "<p><strong>Дата: </strong> ".$receptionNumber."</p>\r\n";
            $msg .= "<p><strong>Время: </strong> ".$receptionNumber."</p>\r\n";
            $msg .= "<p><strong>Оператор: </strong> ".$receptionOperator."</p>\r\n";
            $msg .= "<p><strong>Посетитель: </strong> ".$receptionNumber."</p>\r\n";
            $msg .= "<p><strong>Телефон: </strong> ".$receptionNumber."</p>\r\n";
            $msg .= "</body></html>";
            
            // отправка сообщения
            if($sendto != "") {
                mail($sendto, $subject, $msg, $headers);
                echo "Cообщение успешно отправленно. Пожалуйста, оставайтесь на связи<br>";
            }
            else {
                echo "Возникла ошибка при отправке формы. Попробуйте еще раз<br>";
            }
        }
    ?>
<?php endforeach; ?>