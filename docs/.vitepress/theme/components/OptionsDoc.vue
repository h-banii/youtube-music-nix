<template>
  <div v-if="!!data">
    <div v-for="(value, key, _) in data" :key="key">
      <h2>{{ key.replace(/[^.]+\./, "") }}</h2>
      <div :class="$style['option-meta-container']">
        <div :class="$style['option-meta-name']">Name</div>
        <div :class="$style['option-meta-value']">
          <code>{{ key }}</code>
        </div>
        <div :class="$style['option-meta-name']">Description</div>
        <div :class="$style['option-meta-value']">
          <pre
            v-if="value.description.includes('\n')"
            v-html="value.description"
          ></pre>
          <div v-else v-html="value.description"></div>
        </div>
        <div :class="$style['option-meta-name']">Type</div>
        <div :class="$style['option-meta-value']" v-html="value.type"></div>
        <div :class="$style['option-meta-name']" v-if="!!value.default">
          Default
        </div>
        <div :class="$style['option-meta-value']" v-if="!!value.default">
          <code v-html="value.default.text"></code>
        </div>
        <div :class="$style['option-meta-name']" v-if="!!value.example">
          Example
        </div>
        <div :class="$style['option-meta-value']" v-if="!!value.example">
          <div v-if="value.example.text.includes('\n')" class="language-nix">
            <pre><code v-html="value.example.text"></code></pre>
          </div>
          <code v-else v-html="value.example.text"></code>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useData } from "vitepress";
import { ref, onMounted } from "vue";
import mockedOptions from "./options.mock.json";

const props = defineProps(["file"]);

const data = ref({});
const { site } = useData();

if (import.meta.env.PROD) {
  onMounted(() =>
    fetch(site.fn().base + props.file)
      .then((res) => res.json())
      .then((json) => (data.value = json))
      .catch(console.log),
  );
} else {
  data.value = mockedOptions;
}
</script>

<style module>
.option-meta-container {
  display: grid !important;
  grid-template-columns: 100px 1fr;
  row-gap: 0.5em;
  column-gap: 1em;
}

.option-meta-name {
  text-align: right;
}

button {
  font-size: unset;
  text-align: left;
}
</style>
