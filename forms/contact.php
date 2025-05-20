<!-- <?php
require '../assets/vendor/php-email-form/php-email-form.php';

$mail = new PHP_Email_Form;
$mail->smtp = [
  'host'       => 'smtp.gmail.com',
  'username'   => 'muthuselvan39820@gmail.com',
  'password'   => 'szcb rzho honx cpht',
  'port'       => '587',
  'encryption' => 'tls',
];

$mail->to         = 'muthuselvan39820@gmail.com';
$mail->from_name  = 'SMTP self‑test';
$mail->from_email = 'muthuselvan39820@gmail.com';
$mail->subject    = 'SMTP test (should arrive in your Inbox)';
$mail->add_message('If you see this, SMTP works!');

if ($mail->send()) {
  echo "✅  Message sent – check your mailbox.";
} else {
  echo "❌  SMTP failed – " . $mail->error;
}
