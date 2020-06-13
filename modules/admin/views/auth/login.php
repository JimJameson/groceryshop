<?php

?>


<div class="login-box">
    <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>

        <?php
            $form = \yii\widgets\ActiveForm::begin()
        ?>

        <?=
            $form->field($model, 'username', [
                'template' =>
                "<div class='form-group has-feedback'>
                    {input}
                    <span class='glyphicon glyphicon-user form-control-feedback'></span>
                    <div>{error}</div>
                </div>",
            ])->textInput(['placeholder' => 'Login']);
        ?>

        <?=
        $form->field($model, 'password', [
            'template' =>
                "<div class='form-group has-feedback'>
                    {input}
                    <span class='glyphicon glyphicon-lock form-control-feedback'></span>
                    <div>{error}</div>
                </div>",
        ])->passwordInput(['placeholder' => 'Password']);
        ?>
            <div class="row">
                <div class="col-xs-8">
                    <?=
                        $form->field($model, 'rememberMe')->checkbox([
                            'template' =>
                            "{label} {input}"
                        ])
                    ?>
                </div>
                <div class="col-xs-4">
                    <?= \yii\helpers\Html::submitButton('Login', ['class' => 'btn btn-primary btn-block btn-flat']) ?>
                </div>
            </div>

        <?php \yii\widgets\ActiveForm::end() ?>
    </div>
</div>
