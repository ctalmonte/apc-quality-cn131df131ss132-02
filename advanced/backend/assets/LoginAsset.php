<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class LoginAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/bootstrap.min.css',
        'css/site.css',
        //'https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css',
       // 'https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css',
        'css/AdminLTE.min.css',
        'css/skins/_all-skins.min.css',
        'css/iCheck/flat/blue.css',
        'css/morris/morris.css',
        'css/jvectormap/jquery-jvectormap-1.2.2.css',
        'css/datepicker/datepicker3.css',
        'css/daterangepicker/daterangepicker-bs3.css',
        'css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css'
    ];
    public $js = [
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
