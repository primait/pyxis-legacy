<template>
    <aside class="sidebar">
        <nav>
            <ul>
                <li v-for="item in menu">
                    <router-link :to=item.path>{{ item.label }}</router-link>
                </li>
            </ul>
        </nav>
    </aside>
</template>

<script>
export default {
  name: 'Sidebar',
  props: {
      menu: {
          type: Array,
          required: true
      }
  }
}
</script>

<style module lang="scss" scoped>
    .sidebar {

    }
</style>