<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "category_banner".
 *
 * @property int $id
 * @property string|null $title
 * @property string|null $content
 * @property string|null $img
 * @property int|null $category_id
 */
class CategoryBanner extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'category_banner';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['content'], 'string'],
            [['category_id'], 'integer'],
            [['title', 'img'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'content' => 'Content',
            'img' => 'Img',
            'category_id' => 'Category ID',
        ];
    }
}
