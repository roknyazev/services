<?php

$cfg['blowfish_secret'] = 'pass123456789'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */
$i = 0;
$i++;

$cfg['Servers'][$i]['auth_type'] = 'cookie';

$cfg['Servers'][$i]['host'] = 'cip-mysql';
$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['user'] = 'user';
$cfg['Servers'][$i]['password'] = 'password';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';