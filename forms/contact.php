<?php
require '../assets/vendor/php-email-form/php-email-form.php';

$mail = new PHP_Email_Form;

// Optional: Enable debug
$mail->ajax = true; 

$mail->smtp = array(
  'host'       => 'smtp.gmail.com',
  'username'   => 'muthuselvan39820@gmail.com',
  'password'   => 'szcb rzho honx cpht',  // Use App Password, not main password
  'port'       => '587',
  'encryption' => 'tls'
);

$mail->to         = 'muthuselvan39820@gmail.com';
$mail->from_name  = $_POST['name'] ?? 'Website Visitor';
$mail->from_email = $_POST['email'] ?? 'no-reply@example.com';
$mail->subject    = $_POST['subject'] ?? 'New Message from Contact Form';

$mail->add_message($_POST['message'], 'Message');

if ($mail->send()) {
  echo 'Message sent successfully!';
} else {
  http_response_code(500);
  echo 'Error: ' . $mail->error;
}
?>
