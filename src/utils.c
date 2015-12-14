#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "latino.h"
#include "ast.h"
#include "utils.h"
#include "libmem.h"

char* strdup0(const char* s)
{
  size_t len = strlen(s);
  char* p;
  p = (char*)lmalloc(len + 1);
  if (p) {
    strncpy(p, s, len);
  }
  p[len] = '\0';
  return p;
}

char* parse_string(const char* s, size_t len)
{
  char* ret = lmalloc(len + 1);
  int j = 0;
  int c = '@';
  for (size_t i = 0; i < len; i++) {
    switch (s[i]) {
    case '\\': {
      switch (s[i + 1]) {
      case 'a':
        c = '\n';
        i++;
        goto save;
      case 'b':
        c = '\n';
        i++;
        goto save;
      case 'f':
        c = '\n';
        i++;
        goto save;
      case 'n':
        c = '\n';
        i++;
        goto save;
      case 'r':
        c = '\n';
        i++;
        goto save;
      case 't':
        c = '\t';
        i++;
        goto save;
      case 'v':
        c = '\n';
        i++;
        goto save;
      default:
        break;
      }
    } break;
    default:
      c = s[i];
      break;
    }
  save:
    ret[j] = c;
    j++;
  }
  ret[j] = '\0';
  return ret;
}

char* concat(char* s1, char* s2)
{
  char* s3 = malloc(strlen(s1) + strlen(s2) + 1);
  strcpy(s3, s1);
  strcat(s3, s2);
  return s3;
}

char* int2str(long i)
{
  char s[255];
  char* r = malloc(strlen(s) + 1);
  lnsprintf(s, 255, "%ld", i);
  strcpy(r, s);
  return r;
}

char* double2str(double d)
{
  char s[64];
  char* r = malloc(strlen(s) + 1);
  lnsprintf(s, 64, "%g", (float)d);
  strcpy(r, s);
  return r;
}

char* char2str(char c)
{
  char s[2];
  char* r = malloc(2);
  lnsprintf(s, 2, "%c", c);
  strcpy(r, s);
  return r;
}

char* bool2str(int i)
{
  char s[10];
  char* r = malloc(11);
  if (i) {
    lnsprintf(s, 10, "%s", "verdadero");
    strcpy(r, s);
  }
  else {
    lnsprintf(s, 10, "%s", "falso");
    strcpy(r, s);
  }
  return r;
}

bool startsWith(char* base, char* str) {
  return (strstr(base, str) - base) == 0;
}

bool endsWith(char* base, char* str) {
  int blen = strlen(base);
  int slen = strlen(str);
  return (blen >= slen) && (0 == strcmp(base + blen - slen, str));
}

int indexOf(char* base, char* str) {
  return indexOf_shift(base, str, 0);
}

int indexOf_shift(char* base, char* str, int startIndex) {
  int result;
  int baselen = strlen(base);
  if (strlen(str) > baselen || startIndex > baselen) {
    result = -1;
  }
  else {
    if (startIndex < 0) {
      startIndex = 0;
    }
    char* pos = strstr(base + startIndex, str);
    if (pos == NULL) {
      result = -1;
    }
    else {
      result = pos - base;
    }
  }
  return result;
}

int lastIndexOf(char* base, char* str) {
  int result;
  if (strlen(str) > strlen(base)) {
    result = -1;
  }
  else {
    int start = 0;
    int endinit = strlen(base) - strlen(str);
    int end = endinit;
    int endtmp = endinit;
    while (start != end) {
      start = indexOf_shift(base, str, start);
      end = indexOf_shift(base, str, end);
      if (start == -1) {
        end = -1;
      }
      else if (end == -1) {
        if (endtmp == (start + 1)) {
          end = start;
        }
        else {
          end = endtmp - (endtmp - start) / 2;
          if (end <= start) {
            end = start + 1;
          }
          endtmp = end;
        }
      }
      else {
        start = end;
        end = endinit;
      }
    }
    result = start;
  }
  return result;
}

char* insert(char *dest, char* src, int pos){
  int srclen = strlen(src);
  int dstlen = strlen(dest);
  if (pos < 0){
    pos = dstlen + pos;
  }
  if (pos > dstlen){
    pos = dstlen;
  }
  char *m = malloc(srclen + dstlen + 1);
  memcpy(m, dest, pos);
  memcpy(m + pos, src, srclen);
  memcpy(m + pos + srclen, dest + pos, dstlen - pos + 1);
  return m;
}

char* padLeft(char* base, int n, char c){
  int len = (int)strlen(base);  
  char *tmp = NULL;
  if (n <= len){
    tmp = malloc(len + 1);
    strcpy(tmp, base);
    return tmp;
  }
  tmp = malloc(n + 1);
  tmp = "";
  int i = 0;
  for (i; i < (n - len); i++){
    tmp = concat(tmp, char2str(c));
  }
  tmp = concat(tmp, base);
  return tmp;
}

char* padRight(char *base, int n, char c) {
  int len = (int)strlen(base);
  char *tmp = NULL;
  if (len >= n) {
    tmp = malloc(len + 1);
    strcpy(tmp, base);
    return tmp;
  }
  tmp = malloc(n + 1);
  tmp = base;
  int i;
  for (i = 0; i < (n - len); i++) {
    tmp = concat(tmp, char2str(c));
  }
  return tmp;
}

char *replace(char *str, char *orig, char *rep)
{
  char buffer[1024];
  char *p;
  if (!(p = strstr(str, orig))){
    return str;
  }
  strncpy(buffer, str, p - str);
  buffer[p - str] = '\0';
  sprintf(buffer + (p - str), "%s%s", rep, p + strlen(orig));
  //reemplazar todas las ocurrencias
  if (strstr(buffer, orig) != NULL){
    strcpy(buffer, replace(buffer, orig, rep));
  }   
  return buffer;
}

char *substring(const char* str, int beg, int n)
{
  char *ret = malloc(n + 1);
  strncpy(ret, (str + beg), n);
  *(ret + n) = 0;

  return ret;
}

char *toLower(const char* str){
  int len = strlen(str);
  char *ret = malloc(len + 1);
  int i = 0;
  for (i; i < len; i++){
    ret[i] = tolower(str[i]);
  }
  ret[len] = 0;
  return ret;
}

char *toUpper(const char* str){
  int len = strlen(str);
  char *ret = malloc(len + 1);
  int i = 0;
  for (i; i < len; i++){
    ret[i] = toupper(str[i]);
  }
  ret[len] = 0;
  return ret;
}

char* trim(const char *str)
{
  char *start, *end;
  for (start = str; *start; start++)
  {
    if (!isspace((unsigned char)start[0]))
      break;
  }
  for (end = start + strlen(start); end > start + 1; end--)
  {
    if (!isspace((unsigned char)end[-1]))
      break;
  }
  char *ret = malloc((end - start) + 1);
  *end = 0;
  if (start > str){
    memcpy(ret, start, (end - start) + 1);
  }
  else{
    memcpy(ret, str, strlen(str));
  }

  return ret;
}

list_node* make_list_node(void* d)
{
  list_node* ret = (list_node*)lmalloc(sizeof(list_node));
  ret->data = d;
  return ret;
}

list_node* make_list()
{
  list_node* start = (list_node*)lmalloc(sizeof(list_node));
  list_node* end = (list_node*)lmalloc(sizeof(list_node));
  start->prev = NULL;
  start->next = end;
  start->data = NULL;
  end->prev = start;
  end->next = NULL;
  end->data = NULL;
  return start;
}

int find_list(list_node* l, void* data)
{
  list_node* c;
  for (c = l; c->next != NULL; c = c->next) {
    if (c->data == data) {
      return 1;
    }
  }
  return 0;
}

void insert_list(list_node* l, void* data)
{
  list_node* ins = (list_node*)lmalloc(sizeof(list_node));
  ins->data = data;
  ins->next = l->next;
  l->next = ins;
  ins->next->prev = ins;
  ins->prev = l;
}

void remove_list(list_node* l, void* data)
{
  list_node* c;
  for (c = l; c->next != NULL; c = c->next) {
    if (c->data == data) {
      c->prev->next = c->next;
      c->next->prev = c->prev;
    }
  }
}

int length_list(list_node* l)
{
  int a = 0;
  list_node* c;
  for (c = l; c->next != NULL; c = c->next) {
    if (c->data != NULL) {
      a++;
    }
  }
  return a;
}

hash_map* make_hash_map()
{
  hash_map* ret = (hash_map*)lmalloc(sizeof(hash_map));
  int c;
  for (c = 0; c < 256; c++) {
    ret->buckets[c] = NULL;
  }
  return ret;
}

int hash(char* key)
{
  int h = 5381;

  unsigned char c;
  for (c = *key; c != '\0'; c = *++key)
    h = h * 33 + c;

  return abs(h % 256);
}

void* get_hash(hash_map* m, char* key)
{
  list_node* cur = m->buckets[hash(key)];
  if (cur == NULL)
    return NULL;
    for (; cur->next != NULL; cur = cur->next) {
        if (cur->data != NULL) {
            if (strcmp(key, ((hash_val *)cur->data)->key) == 0) {
                return ((hash_val *)cur->data)->val;
            }
        }
    }
    return NULL;
}

void set_hash(hash_map *m, char *key, void *val)
{
    hash_val *hv = (hash_val *)lmalloc(sizeof(hash_val));
    strncpy(hv->key, key, (strlen(key)+1));
    hv->val = val;
    int hk = hash(key);
    if (m->buckets[hk] == NULL) {
        m->buckets[hk] = make_list();
    }
    else {
        list_node *c;
        for (c = m->buckets[hk]; c->next != NULL; c = c->next) {
            if (c->data != NULL) {
                if (strcmp(((hash_val *)c->data)->key, key) == 0) {
                    free(c->data);
                    c->data = (void *)hv;
                    return;
                }
            }
        }
    }
    insert_list(m->buckets[hk], (void *)hv);
}

hash_map *copy_hash(hash_map *m)
{
    hash_map *ret = make_hash_map();
    int i;
    for (i = 0; i < 256; i++) {
        list_node *c = m->buckets[i];
        if (c != NULL) {
            for (; c->next != NULL; c = c->next) {
                if (c->data != NULL) {
                    set_hash(ret, ((hash_val *)c->data)->key, ((hash_val *)c->data)->val);
                }
            }
        }
    }
    return ret;
}
