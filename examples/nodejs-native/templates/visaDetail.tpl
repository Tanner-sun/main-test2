<!DOCTYPE html >
<html>
<head>
<title>签证详情</title>
<meta name="Keywords" content="签证详情"/>
<meta name="Description" content="签证详情"/>
{META}
<link rel="stylesheet" type="text/css" href="resources/main.css">
{CSS}
</head>
<body>
<script type="text/javascript" src="resources/main-test2.js"> </script>
<script type="text/javascript">
window.__RENDER_FN__ = {FN};
window.__TEMPLATE__ = {TEMPLATE};
window.__INITIAL_STATE__  = {MODEL};
</script>
<!--@ BODY -->
<div id="container">
  <div class="visaDetail">
    <header>
      <span class="back-btn" :on="click:goBack()"></span>
      <h2 class="title">签证详情</h2>
    </header>
    <article class="visaDetail-body" :class="{'fadeIn' : loadedFlag}">
      <section class="visaDetail-body-head white">
        <span class="visaDetail-body-head-left">
          <img :attr="{'src' : detail.imgUrl}" >
        </span>
        <span class="visaDetail-body-head-right">
          <p>{{detail.productName}}</p>
          <p class="f10 visa-grey">{{detail.map.visa_range}}  （需提前{{detail.map.visa_ahead_days}}天预定）</p>
          <p>
            <span class="visa-grey lh19">出签成功率：<label class="pink">{{detail.map.visa_succeed_probability}}</label></span>
            <span class="fr">
              <i class="f10 pink">¥</i>
              <i class="f19 pink">{{detail.price}}</i>
              <i>起</i>
            </span>
          </p>
        </span>
      </section>
      <section class="visaDetail-body-body white">
        <section class="visaDetail-body-body-tab">
          <nav class="">
            <li :class="{'hightlight' : visaDetailFlag}" :on="click:toggleTab('visaDetailFlag')">签证详情</li>
            <li :class="{'hightlight' : needInfoFlag}" :on="click:toggleTab('needInfoFlag')">所需资料</li>
            <li :class="{'hightlight' : reserveFlag}" :on="click:toggleTab('reserveFlag')">预订须知</li>
            <li :class="{'hightlight' : commentFlag}" :on="click:toggleTab('commentFlag')">点评</li>
          </nav>
        </section>
        <section class="visaDetail-body-body-tabInfo">
          <article class="visaDetail-ct" :if="visaDetailFlag">
            <section>
              <p :if="detail.map.visa_type"><i>签证类型</i>  {{detail.map.visa_type}}</p>
              <p :if="detail.map.visa_price_include"><i>费用组成</i>  {{detail.map.visa_price_include}}</p>
              <p :if="detail.map.visa_handle_length"><i>办理期限</i>  {{detail.map.visa_handle_length}}</p>
              <p :if="detail.map.visa_validity"><i>有效期 </i>  {{detail.map.visa_validity}}</p>
              <p :if="detail.map.visa_stay_days"><i>最长停留</i>  {{detail.map.visa_stay_days}}</p>
              <p :if="detail.map.visa_arrival_count"><i>出境次数</i>  {{detail.map.visa_arrival_count}}</p>
              <p :if="detail.map.visa_face_pass"><i>是否面签</i>  {{detail.map.visa_face_pass}}</p>
            </section>
            <section>
              <p class="accept-area">受理范围</p>
              <p :html="detail.map.visa_range_note || ''" class="visa-grey2"></p>
            </section>
            <p class="visa-prompt">温馨提示</p>
            <section class="visa-prompt-info visa-grey2">
              <p>{{detail.map.visa_prompt}}</p>
            </section>
          </article>
          <article class="needInfo-ct" :if="needInfoFlag">
            <p>将所需材料发送到邮箱</p>
            <p>在职人员</p>
            <p>自由职业者</p>
            <p>学龄前儿童</p>
            <p>退休人员</p>
            <p>学生</p>
          </article>
          <article class="reserve-ct" :if="reserveFlag" :html="toBr(detail.map.visa_note || '')"></article>
          <article :if="commentFlag">4</article>
        </section>
      </section>
    </article>
    <footer class="bottom">
      <span class="favor favor-collect">
        <img src="images/collect_03.png">
        <i>收藏</i>
      </span>
      <span class="favor">
        <img src="images/phone.png">
        <i>电话</i>
      </span>
      <span class="book-intime">立即预订</span>
    </footer>
  </div>
</div>
<!-- BODY @-->
{JS}
</body>
</html>