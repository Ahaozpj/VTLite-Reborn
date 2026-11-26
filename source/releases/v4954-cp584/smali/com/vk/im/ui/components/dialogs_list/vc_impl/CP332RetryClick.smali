.class public final Lcom/vk/im/ui/components/dialogs_list/vc_impl/CP332RetryClick;
.super Ljava/lang/Object;
.source "CP332RetryClick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final presenter:Lcom/vk/im/ui/components/dialogs_list/DialogsListPresenter;


# direct methods
.method public constructor <init>(Lcom/vk/im/ui/components/dialogs_list/DialogsListPresenter;)V
    .registers 2

    iput-object p1, p0, Lcom/vk/im/ui/components/dialogs_list/vc_impl/CP332RetryClick;->presenter:Lcom/vk/im/ui/components/dialogs_list/DialogsListPresenter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 2

    iget-object p1, p0, Lcom/vk/im/ui/components/dialogs_list/vc_impl/CP332RetryClick;->presenter:Lcom/vk/im/ui/components/dialogs_list/DialogsListPresenter;

    invoke-virtual {p1}, Lcom/vk/im/ui/components/dialogs_list/DialogsListPresenter;->cp332RetryInitial()V

    return-void
.end method
