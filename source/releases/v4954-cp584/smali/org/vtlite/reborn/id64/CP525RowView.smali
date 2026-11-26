.class final Lorg/vtlite/reborn/id64/CP525RowView;
.super Landroid/widget/LinearLayout;


# instance fields
.field private final avatar:Landroid/widget/FrameLayout;

.field private final date:Landroid/widget/TextView;

.field private final lines:Landroid/widget/LinearLayout;

.field final owner:Lorg/vtlite/reborn/id64/CP525ListAdapter;

.field private final preview:Landroid/widget/TextView;

.field row:Lorg/vtlite/reborn/id64/DialogPageModel$Row;

.field private final title:Landroid/widget/TextView;

.field private final unread:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/content/Context;Lorg/vtlite/reborn/id64/CP525ListAdapter;)V
    .registers 11

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lorg/vtlite/reborn/id64/CP525RowView;->owner:Lorg/vtlite/reborn/id64/CP525ListAdapter;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    const/16 v0, 0xc

    invoke-static {p1, v0}, Lorg/vtlite/reborn/id64/CP525RowView;->dp(Landroid/content/Context;I)I

    move-result v0

    const/16 v1, 0x8

    invoke-static {p1, v1}, Lorg/vtlite/reborn/id64/CP525RowView;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {p0, v0, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    const/16 v0, 0x40

    invoke-static {p1, v0}, Lorg/vtlite/reborn/id64/CP525RowView;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V

    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lorg/vtlite/reborn/id64/CP525RowView;->avatar:Landroid/widget/FrameLayout;

    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v0, 0x1

    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    sget v0, Lcom/vk/im/ui/c;->placeholder_icon_background:I

    invoke-static {v0}, Lcom/vk/core/ui/themes/VKThemeHelper;->d(I)I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/16 v0, 0x30

    invoke-static {p1, v0}, Lorg/vtlite/reborn/id64/CP525RowView;->dp(Landroid/content/Context;I)I

    move-result v0

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v0, 0xc

    invoke-static {p1, v0}, Lorg/vtlite/reborn/id64/CP525RowView;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    invoke-virtual {p0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lorg/vtlite/reborn/id64/CP525RowView;->lines:Landroid/widget/LinearLayout;

    const/4 v0, 0x1

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, 0x0

    const/4 v1, -0x2

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v3, v0, v1, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v0, 0x10

    sget v1, Lcom/vk/im/ui/c;->text_primary:I

    invoke-static {p1, v0, v1}, Lorg/vtlite/reborn/id64/CP525RowView;->text(Landroid/content/Context;II)Landroid/widget/TextView;

    move-result-object v2

    iput-object v2, p0, Lorg/vtlite/reborn/id64/CP525RowView;->title:Landroid/widget/TextView;

    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v1, 0x1

    invoke-virtual {v2, v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const/16 v0, 0xc

    sget v1, Lcom/vk/im/ui/c;->text_secondary:I

    invoke-static {p1, v0, v1}, Lorg/vtlite/reborn/id64/CP525RowView;->text(Landroid/content/Context;II)Landroid/widget/TextView;

    move-result-object v3

    iput-object v3, p0, Lorg/vtlite/reborn/id64/CP525RowView;->date:Landroid/widget/TextView;

    const/16 v0, 0xe

    sget v1, Lcom/vk/im/ui/c;->text_secondary:I

    invoke-static {p1, v0, v1}, Lorg/vtlite/reborn/id64/CP525RowView;->text(Landroid/content/Context;II)Landroid/widget/TextView;

    move-result-object v2

    iput-object v2, p0, Lorg/vtlite/reborn/id64/CP525RowView;->preview:Landroid/widget/TextView;

    const/16 v0, 0xc

    sget v1, Lcom/vk/im/ui/c;->text_primary:I

    invoke-static {p1, v0, v1}, Lorg/vtlite/reborn/id64/CP525RowView;->text(Landroid/content/Context;II)Landroid/widget/TextView;

    move-result-object v3

    iput-object v3, p0, Lorg/vtlite/reborn/id64/CP525RowView;->unread:Landroid/widget/TextView;

    invoke-static {p1, v3}, Lorg/vtlite/reborn/id64/CP525RowView;->cp581Badge(Landroid/content/Context;Landroid/widget/TextView;)V

    invoke-direct {p0, p1}, Lorg/vtlite/reborn/id64/CP525RowView;->cp582Layout(Landroid/content/Context;)V

    return-void
.end method

.method private addLine(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .registers 9

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0x10

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v2, v1, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, p2, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v4, 0x8

    invoke-static {p1, v4}, Lorg/vtlite/reborn/id64/CP525RowView;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {v0, p3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v1, -0x1

    iget-object v2, p0, Lorg/vtlite/reborn/id64/CP525RowView;->lines:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    return-void
.end method

.method private static cp581Badge(Landroid/content/Context;Landroid/widget/TextView;)V
    .registers 8

    sget v0, Lcom/vk/im/ui/c;->counter_primary_text:I

    invoke-static {v0}, Lcom/vk/core/ui/themes/VKThemeHelper;->d(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v0, 0x11

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    const/16 v0, 0x14

    invoke-static {p0, v0}, Lorg/vtlite/reborn/id64/CP525RowView;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setMinWidth(I)V

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setMinHeight(I)V

    const/4 v0, 0x5

    invoke-static {p0, v0}, Lorg/vtlite/reborn/id64/CP525RowView;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    sget v0, Lcom/vk/im/ui/c;->counter_primary_background:I

    invoke-static {v0}, Lcom/vk/core/ui/themes/VKThemeHelper;->d(I)I

    move-result v0

    invoke-virtual {v4, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/16 v0, 0xa

    invoke-static {p0, v0}, Lorg/vtlite/reborn/id64/CP525RowView;->dp(Landroid/content/Context;I)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v4, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {p1, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private static cp582FormatDate(Landroid/content/Context;J)Ljava/lang/String;
    .registers 8

    :try_start_0
    new-instance v0, Lcom/vk/im/ui/formatters/DialogTimeFormatter;

    invoke-direct {v0, p0}, Lcom/vk/im/ui/formatters/DialogTimeFormatter;-><init>(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    sget v2, Lcom/vk/im/ui/c;->im_new_theme:I

    invoke-static {p0, v2}, Lcom/vk/core/util/ContextExtKt;->g(Landroid/content/Context;I)Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-virtual {v0, p1, p2, v1}, Lcom/vk/im/ui/formatters/DialogTimeFormatter;->b(JLjava/lang/StringBuffer;)V

    goto :goto_19

    :cond_16
    invoke-virtual {v0, p1, p2, v1}, Lcom/vk/im/ui/formatters/DialogTimeFormatter;->a(JLjava/lang/StringBuffer;)V

    :goto_19
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1d
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_1d} :catch_1e

    return-object v0

    :catch_1e
    move-exception v0

    invoke-static {p1, p2}, Landroid/text/format/DateUtils;->isToday(J)Z

    move-result v0

    const v1, 0x10010

    if-eqz v0, :cond_29

    const/4 v1, 0x1

    :cond_29
    invoke-static {p0, p1, p2, v1}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private cp582Layout(Landroid/content/Context;)V
    .registers 8

    sget v0, Lcom/vk/im/ui/c;->im_new_theme:I

    invoke-static {p1, v0}, Lcom/vk/core/util/ContextExtKt;->g(Landroid/content/Context;I)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP525RowView;->lines:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP525RowView;->title:Landroid/widget/TextView;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP525RowView;->preview:Landroid/widget/TextView;

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP525RowView;->date:Landroid/widget/TextView;

    invoke-direct {p0, p1, v0, v1}, Lorg/vtlite/reborn/id64/CP525RowView;->addLine(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x8

    invoke-static {p1, v1}, Lorg/vtlite/reborn/id64/CP525RowView;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP525RowView;->unread:Landroid/widget/TextView;

    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    :cond_2c
    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP525RowView;->title:Landroid/widget/TextView;

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP525RowView;->date:Landroid/widget/TextView;

    invoke-direct {p0, p1, v0, v1}, Lorg/vtlite/reborn/id64/CP525RowView;->addLine(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;)V

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP525RowView;->preview:Landroid/widget/TextView;

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP525RowView;->unread:Landroid/widget/TextView;

    invoke-direct {p0, p1, v0, v1}, Lorg/vtlite/reborn/id64/CP525RowView;->addLine(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;)V

    return-void
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    int-to-float v1, p1

    mul-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method private static text(Landroid/content/Context;II)Landroid/widget/TextView;
    .registers 6

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    int-to-float v1, p1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-static {p2}, Lcom/vk/core/ui/themes/VKThemeHelper;->d(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    return-object v0
.end method


# virtual methods
.method final bind(Ljava/lang/String;Lorg/vtlite/reborn/id64/DialogPageModel$Row;)V
    .registers 11

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/CP525RowView;->clearBinding()V

    if-eqz p2, :cond_75

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP525RowView;->avatar:Landroid/widget/FrameLayout;

    iget-object v1, p2, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->cp579Avatar:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/vtlite/reborn/id64/CP579Avatar;->bind(Landroid/widget/FrameLayout;Ljava/lang/String;)V

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP525RowView;->title:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p2, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->preview:Ljava/lang/String;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1e

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP525RowView;->preview:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1e
    iget-object v0, p2, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->date:Ljava/lang/Long;

    if-eqz v0, :cond_51

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_51

    const-wide v2, 0xf4865700L

    cmp-long v4, v0, v2

    if-gtz v4, :cond_51

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v0, v1}, Lorg/vtlite/reborn/id64/CP525RowView;->cp582FormatDate(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_51

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_51

    iget-object v3, p0, Lorg/vtlite/reborn/id64/CP525RowView;->date:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x0

    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_51
    iget-object v0, p2, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->unreadCount:Ljava/lang/Long;

    if-eqz v0, :cond_75

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_75

    const-wide/16 v2, 0x63

    cmp-long v4, v0, v2

    if-lez v4, :cond_68

    const-string v2, "99+"

    goto :goto_6c

    :cond_68
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    :goto_6c
    iget-object v3, p0, Lorg/vtlite/reborn/id64/CP525RowView;->unread:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x0

    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_75
    return-void
.end method

.method final clearBinding()V
    .registers 4

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/CP525RowView;->row:Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP525RowView;->avatar:Landroid/widget/FrameLayout;

    invoke-static {v1}, Lorg/vtlite/reborn/id64/CP579Avatar;->clear(Landroid/widget/FrameLayout;)V

    const-string v0, ""

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP525RowView;->title:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP525RowView;->preview:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v2, 0x8

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP525RowView;->date:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP525RowView;->unread:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method final cp583RefreshDate(Lorg/vtlite/reborn/id64/DialogPageModel$Row;)V
    .registers 8

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP525RowView;->row:Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    if-eqz p1, :cond_39

    if-ne v0, p1, :cond_39

    iget-object v0, p1, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->date:Ljava/lang/Long;

    if-eqz v0, :cond_39

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_39

    const-wide v2, 0xf4865700L

    cmp-long v4, v0, v2

    if-gtz v4, :cond_39

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v0, v1}, Lorg/vtlite/reborn/id64/CP525RowView;->cp582FormatDate(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_39

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_39

    iget-object v3, p0, Lorg/vtlite/reborn/id64/CP525RowView;->date:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x0

    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_39
    return-void
.end method
