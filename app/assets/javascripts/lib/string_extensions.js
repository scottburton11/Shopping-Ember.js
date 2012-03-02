String.prototype.titleize = function(){
  if(this.length == 0) return this;
  return this[0].toUpperCase() + this.substr(1).toLowerCase();
}
