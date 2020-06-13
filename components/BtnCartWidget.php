<?php


namespace app\components;


use yii\base\Widget;

class BtnCartWidget extends Widget
{
    public $sum;

    public function init()
    {
        parent::init();
        $session = \Yii::$app->session;
        $this->sum = '$';
        $this->sum .= $session['cart.sum'] ?? '0';
    }

    public function run()
    {
        return $this->sum;
    }
}