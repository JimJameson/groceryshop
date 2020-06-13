<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\Product */

$this->title = "Товар: {$model->title}";
$this->params['breadcrumbs'][] = ['label' => 'Товары', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>

<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <?= Html::a('Изменить', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
                <?= Html::a('Удалить', ['delete', 'id' => $model->id], [
                    'class' => 'btn btn-danger',
                    'data' => [
                        'confirm' => 'Вы действительно хотите удалить этот товар?',
                        'method' => 'post',
                    ],
                ]) ?>
            </div>
            <div class="box-body">
                    <div class="product-view">

                        <p>
                        </p>

                        <?= DetailView::widget([
                            'model' => $model,
                            'attributes' => [
                                'id',
//                                'category_id',
                                'title',
                                [
                                    'attribute' => 'category_id',
                                    'value' => isset($model->category->title) ?
                                        Html::a($model->category->title,['category/view', 'id'=>$model->category_id]) :
                                        'нет',
                                    'format' => 'html',
                                    'label' => 'Категория',
                                ],
                                'content:html',
                                'price',
                                'old_price',
                                'description',
                                'keywords',
//                                'img',
                                [
                                    'attribute' => 'img',
                                    'value' => "@web/{$model->img}",
                                    'format' => ['image', ['width' => '100px']],

                                ],
                                [
                                    'attribute' => 'is_offer',
                                    'format' => 'boolean',
                                ],
                            ],
                        ]) ?>

                    </div>
                </div>
        </div>
    </div>
</div>




