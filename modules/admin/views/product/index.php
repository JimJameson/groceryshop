<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\modules\admin\models\ProductSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Список товаров';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <?= Html::a('Добавить товар', ['create'], ['class' => 'btn btn-success']) ?>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="product-index">

                    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

                    <?= GridView::widget([
                        'dataProvider' => $dataProvider,
                        'filterModel' => $searchModel,
                        'columns' => [
                            ['class' => 'yii\grid\SerialColumn'],

                            'id',
                            [
                                'attribute' => 'category.title',
                                'label' => 'Категория',
                                'value' => function($data) {
                                    return Html::a($data->category->title,['category/view', 'id' => $data->category->id]);
                                },
                                'format' => 'html',
                            ],
                            'title',
//                            'content:ntext',
                            'price',
                            //'old_price',
                            //'description',
                            //'keywords',
                            //'img',
                            //'is_offer',

                            ['class' => 'yii\grid\ActionColumn'],
                        ],
                    ]); ?>


                </div>
            </div>
        </div>
    </div>
</div>



