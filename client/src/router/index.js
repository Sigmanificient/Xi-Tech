import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import TicketView from "@/views/TicketView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
    },
    {
      path: "/ticket/:id",
      name: "ticket",
      component: TicketView,
    },
  ],
});

export default router;
