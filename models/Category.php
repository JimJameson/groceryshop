<?php


namespace app\models;


use yii\db\ActiveRecord;

class Category extends ActiveRecord
{

    public static function tableName()
    {
        return 'category';
    }

    public function getCategoryBanner()
    {
        return $this->hasMany(CategoryBanner::class, ['category_id' => 'id']);
    }

}