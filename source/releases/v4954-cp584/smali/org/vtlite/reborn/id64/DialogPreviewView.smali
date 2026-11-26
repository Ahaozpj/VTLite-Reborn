.class public final Lorg/vtlite/reborn/id64/DialogPreviewView;
.super Landroid/view/View;
.source "DialogPreviewView.java"

# interfaces
.implements Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.implements Ljava/lang/Runnable;


# instance fields
.field private cp387Entered:Z

.field private cp387Painted:Z

.field private cp387Rejected:Z

.field private cp387Skipped:Z

.field private cp389PreDrawEntered:Z

.field private cp425Active:Lorg/vtlite/reborn/id64/Id64HistoryProbe;

.field private cp425ChosenRow:I

.field private cp497Selected:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

.field private frame:Landroid/graphics/Canvas;

.field private final inset:I

.field private final line:I

.field private final main:Landroid/os/Handler;

.field private observer:Landroid/view/ViewTreeObserver;

.field private final paint:Landroid/text/TextPaint;

.field private removed:Z

.field private final request:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

.field private final retry:Landroid/widget/TextView;

.field private rows:I

.field private final scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

.field private final scroll:Landroid/widget/ScrollView;


# direct methods
.method private constructor <init>(Landroid/widget/TextView;Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope;)V
    .registers 6

    .line 31
    invoke-virtual {p1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 21
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->main:Landroid/os/Handler;

    .line 32
    iput-object p1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->retry:Landroid/widget/TextView;

    .line 33
    iput-object p2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->request:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    .line 34
    iput-object p3, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

    .line 35
    new-instance p2, Landroid/text/TextPaint;

    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    iput-object p2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->paint:Landroid/text/TextPaint;

    .line 36
    iget-object p2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->paint:Landroid/text/TextPaint;

    invoke-virtual {p1}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/text/TextPaint;->setColor(I)V

    const/4 p3, -0x1

    invoke-virtual {p2, p3}, Landroid/text/TextPaint;->setColor(I)V

    .line 37
    iget-object p2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->paint:Landroid/text/TextPaint;

    invoke-virtual {p2}, Landroid/text/TextPaint;->getTextSize()F

    move-result p2

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    const/16 p3, 0x8

    invoke-static {p3, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    iput p2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->inset:I

    .line 38
    iget-object p2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->paint:Landroid/text/TextPaint;

    invoke-virtual {p2}, Landroid/text/TextPaint;->getFontSpacing()F

    move-result p2

    const p3, 0x3fcccccd    # 1.6f

    mul-float/2addr p2, p3

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    const/4 p3, 0x1

    invoke-static {p3, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    iput p2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->line:I

    .line 39
    new-instance p2, Landroid/widget/ScrollView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->scroll:Landroid/widget/ScrollView;

    const p1, -0x1000000

    invoke-virtual {p2, p1}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    .line 40
    iget-object p1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->scroll:Landroid/widget/ScrollView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/ScrollView;->setSaveEnabled(Z)V

    .line 41
    iget-object p1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {p1, p3}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 42
    invoke-virtual {p0, p2}, Lorg/vtlite/reborn/id64/DialogPreviewView;->setSaveEnabled(Z)V

    .line 43
    const-string p1, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u0441\u043f\u0438\u0441\u043e\u043a. \u041d\u0430\u0436\u043c\u0438\u0442\u0435 \u0438\u043c\u044f \u0434\u043b\u044f \u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440\u0430 \u0437\u0430\u043f\u0438\u0441\u0438. \u0418\u0441\u0442\u043e\u0440\u0438\u044f \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u043d\u0430. \u041f\u043e\u0432\u0442\u043e\u0440 \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0438 \u0432\u043d\u0438\u0437\u0443."

    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/DialogPreviewView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 44
    invoke-virtual {p0, p0}, Lorg/vtlite/reborn/id64/DialogPreviewView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    const/4 p1, -0x1

    iput p1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp425ChosenRow:I

    return-void
.end method

.method private cp497PaintDetail(Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)V
    .registers 9

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->frame:Landroid/graphics/Canvas;

    if-eqz v0, :cond_3d

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/DialogPreviewView;->getWidth()I

    move-result v1

    iget v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->inset:I

    mul-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->inset:I

    int-to-float v2, v2

    iget-object v3, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->paint:Landroid/text/TextPaint;

    invoke-virtual {v3}, Landroid/text/TextPaint;->ascent()F

    move-result v3

    sub-float/2addr v2, v3

    const-string v3, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u0430\u044f \u0437\u0430\u043f\u0438\u0441\u044c \u0434\u0438\u0430\u043b\u043e\u0433\u0430"

    invoke-direct {p0, v0, v3, v2, v1}, Lorg/vtlite/reborn/id64/DialogPreviewView;->drawLine(Landroid/graphics/Canvas;Ljava/lang/String;FF)V

    iget v4, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->line:I

    int-to-float v4, v4

    add-float/2addr v2, v4

    const-string v3, "\u041d\u0430\u0437\u0430\u0434 \u043a \u0441\u043f\u0438\u0441\u043a\u0443"

    invoke-direct {p0, v0, v3, v2, v1}, Lorg/vtlite/reborn/id64/DialogPreviewView;->drawLine(Landroid/graphics/Canvas;Ljava/lang/String;FF)V

    add-float/2addr v2, v4

    invoke-static {p1, p2}, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp497UniqueLabel(Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_34

    const-string v3, "\u0417\u0430\u043f\u0438\u0441\u044c \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u043d\u0430"

    :cond_34
    invoke-direct {p0, v0, v3, v2, v1}, Lorg/vtlite/reborn/id64/DialogPreviewView;->drawLine(Landroid/graphics/Canvas;Ljava/lang/String;FF)V

    add-float/2addr v2, v4

    const-string v3, "\u0422\u043e\u043b\u044c\u043a\u043e \u0437\u0430\u043f\u0438\u0441\u044c \u0438\u0437 \u0441\u043f\u0438\u0441\u043a\u0430. \u041d\u0435 \u0438\u0441\u0442\u043e\u0440\u0438\u044f \u043f\u0435\u0440\u0435\u043f\u0438\u0441\u043a\u0438."

    invoke-direct {p0, v0, v3, v2, v1}, Lorg/vtlite/reborn/id64/DialogPreviewView;->drawLine(Landroid/graphics/Canvas;Ljava/lang/String;FF)V

    :cond_3d
    return-void
.end method

.method private static cp497UniqueLabel(Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Ljava/lang/String;
    .registers 9

    const/4 v0, 0x0

    if-eqz p0, :cond_2b

    if-eqz p1, :cond_2b

    iget-object v1, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->labels:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/16 v3, 0x14

    if-gt v2, v3, :cond_2b

    const/4 v3, 0x0

    const/4 v4, -0x1

    :goto_11
    if-ge v3, v2, :cond_23

    invoke-virtual {p0, v3}, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->peerAt(I)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_20

    if-gez v4, :cond_2b

    move v4, v3

    :cond_20
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    :cond_23
    if-ltz v4, :cond_2b

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :cond_2b
    return-object v0
.end method

.method private drawLine(Landroid/graphics/Canvas;Ljava/lang/String;FF)V
    .registers 7

    .line 106
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->paint:Landroid/text/TextPaint;

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-static {p2, v0, p4, v1}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object p2

    .line 107
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    iget p4, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->inset:I

    int-to-float p4, p4

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->paint:Landroid/text/TextPaint;

    invoke-virtual {p1, p2, p4, p3, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 108
    return-void
.end method

.method public static show(Landroid/widget/TextView;Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope;)Z
    .registers 8

    const-string v0, "RebornCP389"

    const-string v1, "SHOW_ENTER"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 48
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_7f

    if-eqz p0, :cond_7f

    .line 49
    invoke-virtual {p0}, Landroid/widget/TextView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_7f

    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/FrameLayout;

    if-nez v0, :cond_24

    goto :goto_7f

    .line 50
    :cond_24
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 51
    new-instance v1, Lorg/vtlite/reborn/id64/DialogPreviewView;

    invoke-direct {v1, p0, p1, p2}, Lorg/vtlite/reborn/id64/DialogPreviewView;-><init>(Landroid/widget/TextView;Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope;)V

    .line 52
    invoke-virtual {p2, p1, v1}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->bind(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;)I

    move-result p2

    .line 53
    if-gez p2, :cond_36

    return v2

    .line 54
    :cond_36
    iput p2, v1, Lorg/vtlite/reborn/id64/DialogPreviewView;->rows:I

    .line 56
    :try_start_38
    iget-object p2, v1, Lorg/vtlite/reborn/id64/DialogPreviewView;->scroll:Landroid/widget/ScrollView;

    const/4 v3, -0x2

    const/4 v4, -0x1

    invoke-virtual {p2, v1, v4, v3}, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V

    .line 57
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 58
    invoke-virtual {p0}, Landroid/widget/TextView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p2

    iput-object p2, v1, Lorg/vtlite/reborn/id64/DialogPreviewView;->observer:Landroid/view/ViewTreeObserver;

    .line 59
    iget-object p2, v1, Lorg/vtlite/reborn/id64/DialogPreviewView;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {p2, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 60
    iget-object p2, v1, Lorg/vtlite/reborn/id64/DialogPreviewView;->scroll:Landroid/widget/ScrollView;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p2}, Landroid/widget/ScrollView;->bringToFront()V

    invoke-virtual {p2}, Landroid/widget/ScrollView;->invalidate()V

    .line 61
    invoke-virtual {p0}, Landroid/widget/TextView;->isAttachedToWindow()Z

    move-result p2

    if-eqz p2, :cond_76

    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    if-ne p2, v0, :cond_76

    invoke-virtual {p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368StillCurrent()Z

    move-result p1

    if-nez p1, :cond_70

    goto :goto_76

    .line 65
    :cond_70
    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 66
    const/4 p0, 0x1

    return p0

    .line 62
    :cond_76
    :goto_76
    invoke-virtual {v1}, Lorg/vtlite/reborn/id64/DialogPreviewView;->run()V
    :try_end_79
    .catch Ljava/lang/RuntimeException; {:try_start_38 .. :try_end_79} :catch_7a

    .line 63
    return v2

    .line 67
    :catch_7a
    move-exception p0

    .line 68
    invoke-virtual {v1}, Lorg/vtlite/reborn/id64/DialogPreviewView;->run()V

    .line 69
    return v2

    .line 49
    :cond_7f
    :goto_7f
    return v2
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 7

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_58

    iget v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp425ChosenRow:I

    const/4 v1, -0x1

    iput v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp425ChosenRow:I

    if-ne p0, p1, :cond_58

    if-ltz v0, :cond_58

    iget-boolean v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->removed:Z

    if-nez v1, :cond_58

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_58

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->retry:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_58

    iget-object v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

    iget-object v3, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->request:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    invoke-virtual {v2, v3, p0}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->boundTo(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;)Z

    move-result v1

    if-eqz v1, :cond_58

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp497Selected:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    if-eqz v1, :cond_39

    if-nez v0, :cond_58

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp497Selected:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    goto :goto_45

    :cond_39
    iget v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->rows:I

    if-ge v0, v1, :cond_4f

    invoke-virtual {v2, v3, p0, v0}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->peerForTap(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;I)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    move-result-object v1

    if-eqz v1, :cond_58

    iput-object v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp497Selected:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    :goto_45
    const/4 v1, 0x0

    iget-object v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v2, v1, v1}, Landroid/widget/ScrollView;->scrollTo(II)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    goto :goto_58

    :cond_4f
    add-int/lit8 v1, v1, 0x1

    if-ne v0, v1, :cond_58

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->retry:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->performClick()Z

    :cond_58
    :goto_58
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp497Selected:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    const/4 v0, -0x1

    iput v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp425ChosenRow:I

    const-string v0, "RebornCP389"

    const-string v1, "OVERLAY_DETACHED"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 123
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp425Active:Lorg/vtlite/reborn/id64/Id64HistoryProbe;

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->closeOnMain()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp425Active:Lorg/vtlite/reborn/id64/Id64HistoryProbe;

    :cond_18
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->close()V

    .line 124
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 125
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 5

    .line 79
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-boolean v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp387Entered:Z

    if-nez v2, :cond_12

    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp387Entered:Z

    const-string v1, "RebornCP387"

    const-string v2, "DRAW_ENTER"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 80
    :cond_12
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->removed:Z

    if-nez v0, :cond_5c

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/DialogPreviewView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_5c

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/DialogPreviewView;->getWindowVisibility()I

    move-result v0

    if-eqz v0, :cond_23

    goto :goto_5c

    .line 81
    :cond_23
    iput-object p1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->frame:Landroid/graphics/Canvas;

    .line 83
    const/4 p1, 0x0

    :try_start_26
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->request:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    invoke-virtual {v0, v1, p0}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->draw(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;)Z

    move-result v0

    if-eqz v0, :cond_40

    iget-boolean v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp387Painted:Z

    if-nez v2, :cond_3f

    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp387Painted:Z

    const-string v1, "RebornCP387"

    const-string v2, "DRAW_OK"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    :cond_3f
    goto :goto_4f

    :cond_40
    iget-boolean v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp387Rejected:Z

    if-nez v2, :cond_4f

    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp387Rejected:Z

    const-string v1, "RebornCP387"

    const-string v2, "SCOPE_REJECTED"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    :cond_4f
    :goto_4f
    if-nez v0, :cond_54

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/DialogPreviewView;->requestRemoval()V
    :try_end_54
    .catchall {:try_start_26 .. :try_end_54} :catchall_58

    .line 85
    :cond_54
    iput-object p1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->frame:Landroid/graphics/Canvas;

    .line 86
    nop

    .line 87
    return-void

    .line 85
    :catchall_58
    move-exception v0

    iput-object p1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->frame:Landroid/graphics/Canvas;

    .line 86
    throw v0

    .line 80
    :cond_5c
    :goto_5c
    iget-boolean v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp387Skipped:Z

    if-nez v2, :cond_6b

    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp387Skipped:Z

    const-string v1, "RebornCP387"

    const-string v2, "DRAW_SKIPPED"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    :cond_6b
    return-void
.end method

.method protected onMeasure(II)V
    .registers 6

    .line 74
    iget v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->inset:I

    mul-int/lit8 v0, v0, 0x2

    iget v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->rows:I

    add-int/lit8 v1, v1, 0x3

    const/4 v2, 0x4

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->line:I

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    .line 75
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-static {v0, p2}, Lorg/vtlite/reborn/id64/DialogPreviewView;->resolveSize(II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lorg/vtlite/reborn/id64/DialogPreviewView;->setMeasuredDimension(II)V

    .line 76
    return-void
.end method

.method public onPreDraw()Z
    .registers 3

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp389PreDrawEntered:Z

    if-nez v0, :cond_f

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp389PreDrawEntered:Z

    const-string v0, "RebornCP389"

    const-string v1, "PREDRAW_ENTER"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 111
    :cond_f
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->removed:Z

    if-nez v0, :cond_23

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->request:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    invoke-virtual {v0, v1, p0}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->boundTo(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;)Z

    move-result v0

    if-eqz v0, :cond_1e

    goto :goto_23

    .line 112
    :cond_1e
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/DialogPreviewView;->run()V

    .line 113
    const/4 v0, 0x0

    return v0

    .line 111
    :cond_23
    :goto_23
    const/4 v0, 0x1

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eqz v0, :cond_48

    const/4 v1, 0x3

    if-eq v0, v1, :cond_48

    const/4 v1, 0x5

    if-eq v0, v1, :cond_48

    const/4 v1, 0x6

    if-eq v0, v1, :cond_48

    const/4 v1, 0x1

    if-ne v0, v1, :cond_4b

    const-string v2, "RebornCP436"

    const-string v3, "HISTORY_TOUCH_UP"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_48

    iget v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->inset:I

    int-to-float v2, v2

    iget-object v3, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->paint:Landroid/text/TextPaint;

    invoke-virtual {v3}, Landroid/text/TextPaint;->ascent()F

    move-result v3

    sub-float/2addr v2, v3

    sub-float/2addr v0, v2

    iget-object v3, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->paint:Landroid/text/TextPaint;

    invoke-virtual {v3}, Landroid/text/TextPaint;->descent()F

    move-result v3

    sub-float/2addr v0, v3

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float/2addr v0, v3

    const/4 v4, 0x0

    cmpg-float v4, v0, v4

    if-ltz v4, :cond_44

    iget v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->line:I

    int-to-float v2, v2

    div-float/2addr v0, v2

    float-to-int v0, v0

    goto :goto_45

    :cond_44
    const/4 v0, -0x1

    :goto_45
    iput v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp425ChosenRow:I

    goto :goto_4b

    :cond_48
    const/4 v0, -0x1

    iput v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp425ChosenRow:I

    :cond_4b
    :goto_4b
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 120
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 4

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp497Selected:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    const/4 v0, -0x1

    iput v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp425ChosenRow:I

    const-string v0, "RebornCP389"

    const-string v1, "RETRY_DETACHED"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 121
    iget-object p1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

    invoke-virtual {p1}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->close()V

    return-void
.end method

.method public paint(Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;)V
    .registers 8

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp497Selected:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    if-eqz v0, :cond_8

    invoke-direct {p0, p1, v0}, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp497PaintDetail(Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)V

    return-void

    .line 91
    :cond_8
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->frame:Landroid/graphics/Canvas;

    .line 92
    if-nez v0, :cond_d

    return-void

    .line 93
    :cond_d
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/DialogPreviewView;->getWidth()I

    move-result v1

    iget v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->inset:I

    mul-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    .line 94
    iget v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->inset:I

    int-to-float v2, v2

    iget-object v3, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->paint:Landroid/text/TextPaint;

    invoke-virtual {v3}, Landroid/text/TextPaint;->ascent()F

    move-result v3

    sub-float/2addr v2, v3

    .line 95
    const-string v3, "\u0414\u0438\u0430\u043b\u043e\u0433\u0438 \u00b7 \u0442\u043e\u043b\u044c\u043a\u043e \u0447\u0442\u0435\u043d\u0438\u0435"

    invoke-direct {p0, v0, v3, v2, v1}, Lorg/vtlite/reborn/id64/DialogPreviewView;->drawLine(Landroid/graphics/Canvas;Ljava/lang/String;FF)V

    .line 96
    iget-object v3, p1, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->labels:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_31
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_45

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 97
    iget v5, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->line:I

    int-to-float v5, v5

    add-float/2addr v2, v5

    .line 98
    invoke-direct {p0, v0, v4, v2, v1}, Lorg/vtlite/reborn/id64/DialogPreviewView;->drawLine(Landroid/graphics/Canvas;Ljava/lang/String;FF)V

    .line 99
    goto :goto_31

    .line 100
    :cond_45
    iget v3, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->line:I

    int-to-float v3, v3

    add-float/2addr v2, v3

    .line 101
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u041f\u043e\u043a\u0430\u0437\u0430\u043d\u043e "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->labels:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " \u0438\u0437 "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget p1, p1, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->totalRows:I

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1, v2, v1}, Lorg/vtlite/reborn/id64/DialogPreviewView;->drawLine(Landroid/graphics/Canvas;Ljava/lang/String;FF)V

    .line 102
    iget p1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->line:I

    int-to-float p1, p1

    add-float/2addr v2, p1

    const-string p1, "\u0418\u043c\u044f \u2014 \u0437\u0430\u043f\u0438\u0441\u044c. \u0417\u0434\u0435\u0441\u044c \u2014 \u043f\u043e\u0432\u0442\u043e\u0440"

    invoke-direct {p0, v0, p1, v2, v1}, Lorg/vtlite/reborn/id64/DialogPreviewView;->drawLine(Landroid/graphics/Canvas;Ljava/lang/String;FF)V

    .line 103
    return-void
.end method

.method public requestRemoval()V
    .registers 2

    .line 119
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->main:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public run()V
    .registers 3

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp497Selected:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    const/4 v0, -0x1

    iput v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp425ChosenRow:I

    .line 127
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->removed:Z

    if-eqz v0, :cond_b

    return-void

    .line 128
    :cond_b
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->removed:Z

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp387Painted:Z

    if-eqz v0, :cond_15

    const-string v1, "REMOVED_AFTER_DRAW"

    goto :goto_17

    :cond_15
    const-string v1, "REMOVED_BEFORE_DRAW"

    :goto_17
    const-string v0, "RebornCP387"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 129
    const-string v0, "RebornCP427"

    const-string v1, "HISTORY_PREVIEW_REMOVAL"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp425Active:Lorg/vtlite/reborn/id64/Id64HistoryProbe;

    if-eqz v0, :cond_2f

    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->closeOnMain()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp425Active:Lorg/vtlite/reborn/id64/Id64HistoryProbe;

    :cond_2f
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->close()V

    .line 130
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->retry:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 131
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->observer:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_4a

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_4a

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 132
    :cond_4a
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->observer:Landroid/view/ViewTreeObserver;

    .line 133
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_64

    .line 134
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 135
    :cond_64
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->retry:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 136
    return-void
.end method

.method public setActiveProbe(Lorg/vtlite/reborn/id64/Id64HistoryProbe;)V
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp425Active:Lorg/vtlite/reborn/id64/Id64HistoryProbe;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->closeOnMain()V

    :cond_7
    iput-object p1, p0, Lorg/vtlite/reborn/id64/DialogPreviewView;->cp425Active:Lorg/vtlite/reborn/id64/Id64HistoryProbe;

    return-void
.end method
