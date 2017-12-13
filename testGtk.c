#include <gtk/gtk.h>

static void hello( GtkWidget *widget,gpointer data ) {
    gtk_main_quit ();
}

static gboolean delete_event( GtkWidget *widget, GdkEvent  *event, gpointer   data ) {
    g_print ("delete event occurred\n");
    return FALSE; // we do want to quit
}

static void destroy( GtkWidget *widget, gpointer   data ) {
    gtk_main_quit ();
}

int main( int   argc, char *argv[] ) {

    GtkWidget *window;
    GtkWidget *button;

    gtk_init (&argc, &argv);

    window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
    g_signal_connect (window, "delete-event", G_CALLBACK (delete_event), NULL);
    g_signal_connect (window, "destroy", G_CALLBACK (destroy), NULL);
    gtk_container_set_border_width (GTK_CONTAINER (window), 10);
    button = gtk_button_new_with_label ("Hello World");
    g_signal_connect (button, "clicked", G_CALLBACK (hello), NULL);
    gtk_container_add (GTK_CONTAINER (window), button);
    gtk_window_set_title ( GTK_WINDOW(window) , "L:A_N:application_ID:test");
    gtk_widget_show_all (window);

    gtk_main ();
    return 0;
}

