require"import"
import "com.google.android.material.card.MaterialCardView"
import "com.google.android.material.textfield.TextInputLayout"
import "android.widget.*"
import "android.view.WindowManager"
import "com.google.android.material.snackbar.Snackbar"
import "com.google.android.material.button.MaterialButton"
import "com.google.android.material.textfield.TextInputEditText"
import "android.graphics.Color"
import "net.fusionapp.core.ui.adapter.BasePagerAdapter"

--感谢群友的帮助，对于fa2不用改

require "import"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.graphics.Typeface"

import "android.widget.EditText"
import "androidx.cardview.widget.CardView"
import "android.graphics.Typeface"
import "android.widget.TextView"
import "android.widget.LinearLayout"
layout2 =
{
  LinearLayout,--线性布局
  orientation="vertical",--布局方向
  layout_width="fill",--布局宽度
  layout_height="fill",--布局高度
  background="#FF191919",
  {
    LuaWebView,
    layout_width="fill",
    layout_height="80%h",
    id="webView1",
  },
  {
    TextView,
    id = "例句",
    gravity='top',
    layout_width='fill';--控件宽度
    layout_height='wrap';--控件高度
    text="Nevergonnagiveyouup";--显示文字
    textSize='16sp';--文字大小
    textColor=0xffffffff;
    layout_margin='10dp',
    textIsSelectable=false;
  },
  {
    TextView,
    id = "作",
    gravity='right',
    layout_width='fill';--控件宽度
    layout_height='wrap';--控件高度
    text="Nevergonnagiveyouup";--显示文字
    textSize='16sp';--文字大小
    textColor=0xffffffff;
    layout_margin='0dp',
    textIsSelectable=false;
  },
  {
    TextView,
    id = "译",
    gravity='top',
    layout_width='fill';--控件宽度
    layout_height='wrap';--控件高度
    text="哼哼哼 啊啊啊啊啊啊啊啊啊啊 首";--显示文字
    textSize='16sp';--文字大小
    textColor=0xffffffff;
    layout_margin='10dp',
    textIsSelectable=false;
  },
  {
    TextView,
    id = "ic",
    gravity='right',
    layout_width='55dp';--控件宽度
    layout_height='wrap';--控件高度
    text=" ";--显示文字
    textSize='16sp';--文字大小
    textColor=0xffffffff;
    layout_margin='0dp',
    textIsSelectable=false;
    background="https://media-image1.baydn.com/storage_media_image/cassho/4ae6cdcea3b95a4639b09092474a2278.045f7c883a1bd6a5e8864ee0fc222b44.png",
  },
}



activity.setContentView(loadlayout(layout2))


url="https://web.shanbay.com/opp/quotes/today"
Http.get(url,nil,'utf8',nil,function(状态码,网页源码)
  --判断返回状态码，确定网站的正常运行
  if 状态码 ==200 then
    --print(网页源码)
    原句=网页源码:match([[p class="content">(.-)</p><p class="translation]])

    翻译=网页源码:match([[<meta name="description" content="(.-)"><meta name="share_img" content]])

    图片=网页源码:match([[<meta name="share_img" content="(.-)"><link rel="icon"]])

    作者=网页源码:match([[<div class="author"><p>(.-)</p></div>]])

    webView1.loadUrl(图片)
    例句.setText(原句)
    webView1.getSettings().setUseWideViewPort(true) --图片自适应
    webView1.getSettings().setSupportZoom(true); --支持网页缩放
    webView1.getSettings().setBuiltInZoomControls(false); --支持缩放
    webView1.getSettings().setLoadWithOverviewMode(true);
    webView1.setHorizontalScrollBarEnabled(false)
    译.setText(翻译)
    作.setText("--"..作者)
   else
    print('请检查网络连接')
  end
end)
